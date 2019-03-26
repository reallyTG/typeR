## ------------------------------------------------------------------------
library(officer)
example_docx <- system.file(package = "officer", "doc_examples/example.docx")
doc <- read_docx(example_docx)
content <- docx_summary(doc)
head(content)

## ---- message=FALSE, warning=FALSE---------------------------------------
tapply(content$doc_index, 
       content$content_type, 
       function(x) length(unique(x)))

## ---- message=FALSE, warning=FALSE---------------------------------------
par_data <- subset(content, content_type %in% "paragraph") 
par_data <- par_data[, c("doc_index", "style_name", 
                         "text", "level", "num_id") ]
par_data$text <- with(par_data, {
  substr(
    text, start = 1, 
    stop = ifelse(nchar(text)<30, nchar(text), 30) )
})
par_data

## ---- message=FALSE, warning=FALSE---------------------------------------
table_cells <- subset(content, content_type %in% "table cell")
print(head( table_cells) )

## ------------------------------------------------------------------------
table_body <- subset(table_cells, !is_header)
table_body <- table_body[,c("row_id", "cell_id", "text")]
head(table_body)

## ------------------------------------------------------------------------
tapply(table_body$text, 
       list(row_id = table_body$row_id, 
            cell_id = table_body$cell_id
            ), 
       FUN = I
       )

## ------------------------------------------------------------------------
data <- subset(table_cells, is_header) 
data <- data[, c("row_id", "cell_id", "text") ] 

tapply(data$text, 
   list(row_id = data$row_id, 
        cell_id = data$cell_id
        ), FUN = I )

## ------------------------------------------------------------------------
example_pptx <- system.file(package = "officer", "doc_examples/example.pptx")
doc <- read_pptx(example_pptx)
content <- pptx_summary(doc)
head(content)

## ---- message=FALSE, warning=FALSE---------------------------------------
tapply(content$id, 
       content$content_type, 
       function(x) length(unique(x)))

## ---- message=FALSE, warning=FALSE---------------------------------------
par_data <- subset(content, 
                   content_type %in% "paragraph", 
                   select = c(id, text) )
head(par_data)

## ------------------------------------------------------------------------
image_row <- subset(content, content_type %in% "image")
media_extract(doc, path = image_row$media_file, target = "extract.png")

## ---- message=FALSE, warning=FALSE---------------------------------------
table_cells <- subset(content, content_type %in% "table cell")
head(table_cells)

## ------------------------------------------------------------------------
data <- subset(table_cells, id == 18, c(row_id, cell_id, text) )
tapply(data$text, 
   list(row_id = data$row_id, 
        cell_id = data$cell_id
        ), FUN = I )

