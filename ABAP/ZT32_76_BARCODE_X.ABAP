FUNCTION ZT32_76_BARCODE_C.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(BARCODE) TYPE  BARCODE
*"  EXPORTING
*"     VALUE(RETURN) TYPE  BAPIRET2
*"----------------------------------------------------------------------
DATA ls_barcode TYPE ZT32_76_BARCODE.

  ls_barcode-CREATEDON = sy-datum.
  ls_barcode-CREATEDAT = sy-uzeit.
  ls_barcode-CREATEDBY = sy-uname.
  ls_barcode-BARCODE = BARCODE.

  INSERT ZT32_76_BARCODE FROM LS_BARCODE.

  IF sy-subrc IS NOT INITIAL.
    return-type = 'E'.
    return-message = 'Barcode not inserted'.
    RETURN.
  ENDIF.



ENDFUNCTION.

FUNCTION ZT32_76_BARCODE_Q.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(TOP) TYPE  BAPIMAXROW OPTIONAL
*"  EXPORTING
*"     VALUE(ENTITY) TYPE  ZT32_76_BARCODE_T
*"----------------------------------------------------------------------
  SELECT *
      UP TO @TOP ROWS
      FROM
        ZT32_76_BARCODE
      INTO CORRESPONDING FIELDS OF TABLE
        @ENTITY
      WHERE
    CREATEDBY = @SY-UNAME.




ENDFUNCTION.


FUNCTION ZT32_76_BARCODE_R.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(BARCODE) TYPE  ZBARCODE
*"  EXPORTING
*"     VALUE(RETURN) TYPE  BAPIRET2
*"     VALUE(ENTITY) TYPE  ZT32_76_BARCODE_T
*"----------------------------------------------------------------------

  SELECT *
        FROM
          ZT32_76_BARCODE
        INTO CORRESPONDING FIELDS OF TABLE
          @ENTITY
        WHERE
      BARCODE = @BARCODE.



ENDFUNCTION.