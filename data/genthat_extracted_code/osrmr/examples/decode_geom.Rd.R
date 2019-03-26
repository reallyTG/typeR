library(osrmr)


### Name: decode_geom
### Title: Transform encoded polylines to lat-lng data.frame.
### Aliases: decode_geom

### ** Examples

decoded_api_4 <- decode_geom(osrmr::encoded_string_api_4, precision = 5)
decoded_api_5 <- decode_geom(osrmr::encoded_string_api_5, precision = 6)
decoded_api_4[1:3,]
#        lat     lng
# 1 47.10020 8.09970
# 2 47.09850 8.09207
# 3 47.09617 8.09118
decoded_api_5[1:3,]
#        lat      lng
# 1 47.10020 8.099703
# 2 47.09850 8.092074
# 3 47.09617 8.091181
assertthat::assert_that(all.equal(decoded_api_4, decoded_api_5, tolerance = 1e-6))



