library(ijtiff)


### Name: text-image-io
### Title: Read/write an image array to/from disk as text file(s).
### Aliases: text-image-io write_txt_img read_txt_img

### ** Examples

img <- read_tif(system.file('img', 'Rlogo.tif', package = 'ijtiff'))
tmptxt <- tempfile(pattern = "img", fileext = ".txt")
write_txt_img(img, tmptxt)
tmptxt_ch1_path <- paste0(filesstrings::before_last_dot(tmptxt), "_ch1.txt")
print(tmptxt_ch1_path)
txt_img <- read_txt_img(tmptxt_ch1_path)




