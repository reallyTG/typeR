library(gifti)


### Name: gifti_list
### Title: Convert GIFTI to List
### Aliases: gifti_list

### ** Examples

if (have_gifti_test_data(outdir = NULL)) {
   gii_files = download_gifti_data(outdir = NULL)
   L = gifti_list(gii_files[1])
   orig = L$DataArray$Data[[1]]
   encoding = attributes(L$DataArray)$Encoding
   datatype = attributes(L$DataArray)$DataType
   endian = attributes(L$DataArray)$Endian
   vals =  data_decoder(orig, encoding = encoding,
   datatype = datatype, endian = endian)
   enc = data_encoder(vals, encoding = encoding,
   datatype = datatype, endian = endian)
   enc == orig
}



