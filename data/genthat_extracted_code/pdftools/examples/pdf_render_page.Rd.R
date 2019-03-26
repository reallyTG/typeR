library(pdftools)


### Name: pdf_render_page
### Title: Render / Convert PDF
### Aliases: pdf_render_page render pdf_convert poppler_config

### ** Examples

# Rendering should be supported on all platforms now
if(poppler_config()$can_render){

# convert few pages to png
file.copy(file.path(Sys.getenv("R_DOC_DIR"), "NEWS.pdf"), "news.pdf")
pdf_convert("news.pdf", pages = 1:3)

# render into raw bitmap
bitmap <- pdf_render_page("news.pdf")

# save to bitmap formats
png::writePNG(bitmap, "page.png")
jpeg::writeJPEG(bitmap, "page.jpeg")
webp::write_webp(bitmap, "page.webp")

# Higher quality
bitmap <- pdf_render_page("news.pdf", page = 1, dpi = 300)
png::writePNG(bitmap, "page.png")

# slightly more efficient
bitmap_raw <- pdf_render_page("news.pdf", numeric = FALSE)
webp::write_webp(bitmap_raw, "page.webp")
}



