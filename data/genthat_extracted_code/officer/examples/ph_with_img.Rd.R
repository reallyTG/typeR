library(officer)


### Name: ph_with_img
### Title: add image
### Aliases: ph_with_img ph_with_img_at

### ** Examples

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")

img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
if( file.exists(img.file) ){
  doc <- ph_with_img(x = doc, type = "body", src = img.file, height = 1.06, width = 1.39 )
}

print(doc, target = fileout )

fileout <- tempfile(fileext = ".pptx")
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")

img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
if( file.exists(img.file) ){
  doc <- ph_with_img_at(x = doc, src = img.file, height = 1.06, width = 1.39,
    left = 4, top = 4, rot = 45 )
}

print(doc, target = fileout )



