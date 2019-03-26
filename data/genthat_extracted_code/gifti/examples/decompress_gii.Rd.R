library(gifti)


### Name: decompress_gii
### Title: Decompress Gzipped GIFTI (with extension .gz)
### Aliases: decompress_gii

### ** Examples

if (have_gifti_test_data(outdir = NULL)) {
   gii_files = download_gifti_data(outdir = NULL)
   outfile = decompress_gii(gii_files[1])
   print(outfile)
}



