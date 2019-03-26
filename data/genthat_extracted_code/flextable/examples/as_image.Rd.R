library(flextable)


### Name: as_image
### Title: image wrapper
### Aliases: as_image

### ** Examples

library(officer)
img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
data <- head( mtcars, n = 10)
data$img_src <- rep(img.file, 10)
myft <- flextable(data)
myft <- display(myft,
    i = ~ qsec > 18, col_key = "qsec", pattern = "{{r_logo}}",
    formatters = list( r_logo ~ as_image(qsec,
      src = img_src, width = .20, height = .15)),
    fprops = list(qsec = fp_text(color = "orange")) )
myft



