library(assertive.reflection)


### Name: assert_r_has_jpeg_capability
### Title: Does R have a capability?
### Aliases: assert_r_has_aqua_capability assert_r_has_cairo_capability
###   assert_r_has_cledit_capability assert_r_has_fifo_capability
###   assert_r_has_http_ftp_capability assert_r_has_iconv_capability
###   assert_r_has_icu_capability assert_r_has_jpeg_capability
###   assert_r_has_libcurl_capability assert_r_has_libxml_capability
###   assert_r_has_long_double_capability assert_r_has_nls_capability
###   assert_r_has_png_capability assert_r_has_profmem_capability
###   assert_r_has_sockets_capability assert_r_has_tcltk_capability
###   assert_r_has_tiff_capability assert_r_has_x11_capability
###   r_has_aqua_capability r_has_cairo_capability r_has_capability
###   r_has_cledit_capability r_has_fifo_capability
###   r_has_http_ftp_capability r_has_iconv_capability r_has_icu_capability
###   r_has_jpeg_capability r_has_libcurl_capability
###   r_has_libxml_capability r_has_long_double_capability
###   r_has_nls_capability r_has_png_capability r_has_profmem_capability
###   r_has_sockets_capability r_has_tcltk_capability r_has_tiff_capability
###   r_has_x11_capability

### ** Examples

## Not run: 
##D if(r_has_png_capability())
##D {
##D   png("test.png")
##D   with(cars, plot(speed, dist))
##D   dev.off()
##D } else 
##D {
##D   pdf("test.pdf")
##D   with(cars, plot(speed, dist))
##D   dev.off()
##D }
## End(Not run)



