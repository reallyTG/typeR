## ----setup, include = FALSE----------------------------------------------
# only evaluate code if "NOT_CRAN"
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if(NOT_CRAN){
  if(is.na(rtika::tika_jar())){ rtika::install_tika() }  
}


## ---- eval=NOT_CRAN------------------------------------------------------

library('rtika')
library('magrittr')

# Code to get ALL the files in my_path:

# my_path <- "~"
# batch <- file.path(my_path,
#                 list.files(path = my_path,
#                 recursive = TRUE))

# pipe the batch into tika_text() 
# to get plain text

# test files
batch <- c(
  system.file("extdata", "jsonlite.pdf", package = "rtika"),
  system.file("extdata", "curl.pdf", package = "rtika"),
  system.file("extdata", "table.docx", package = "rtika"),
  system.file("extdata", "xml2.pdf", package = "rtika"),
  system.file("extdata", "R-FAQ.html", package = "rtika"),
  system.file("extdata", "calculator.jpg", package = "rtika"),
  system.file("extdata", "tika.apache.org.zip", package = "rtika")
)

text <-  
    batch %>%
    tika_text() 

# normal syntax also works:
# text <- tika_text(batch)


## ---- eval=NOT_CRAN------------------------------------------------------
# Find which files had an issue
# Handle them if needed
batch[which(is.na(text))]

## ---- eval=NOT_CRAN------------------------------------------------------
length(text)

search <-
    text[grep(pattern = ' is ', x = text)]

length(search)

## ---- eval=NOT_CRAN------------------------------------------------------
download_directory <- tempfile('rtika_')

dir.create(download_directory)

urls <- c('https://tika.apache.org/',
          'https://cran.rstudio.com/web/packages/keras/keras.pdf')

downloaded <- 
    urls %>% 
    tika_fetch(download_directory)

# it will add the appropriate file extension to the downloads
downloaded


## ---- eval=NOT_CRAN------------------------------------------------------
# create a directory not already in use.
my_directory <-
   tempfile('rtika_')
                  
dir.create(my_directory)

# pipe the batch to tika_text()
batch %>%
tika_text(threads = 4,
          return = FALSE,
          output_dir = my_directory) 

# list all the file locations 
processed_files <- file.path(
                normalizePath(my_directory),
                list.files(path = my_directory,
                recursive = TRUE)
                )


## ---- eval=NOT_CRAN------------------------------------------------------
processed_files

## ---- eval=NOT_CRAN------------------------------------------------------
library('xml2')

# get XHTML text
html <- 
    batch %>%
    tika_html() %>%
    lapply(xml2::read_html)

# parse links from documents
links <-
    html %>%
    lapply(xml2::xml_find_all, '//a') %>%
    lapply(xml2::xml_attr, 'href')

sample(links[[1]],10)

## ---- eval=NOT_CRAN------------------------------------------------------
# Content-Type
html %>%
lapply(xml2::xml_find_first, '//meta[@name="Content-Type"]') %>%
lapply(xml2::xml_attr, 'content') %>%
unlist()

# Creation-Date
html %>%
lapply(xml2::xml_find_first, '//meta[@name="Creation-Date"]') %>%
lapply(xml2::xml_attr, 'content') %>%
unlist()


## ---- eval=NOT_CRAN------------------------------------------------------
library('jsonlite')
# batch <- system.file("extdata", "calculator.jpg", package = "rtika")

# a list of data.frames
metadata <-
    batch %>% 
    tika_json() %>%
    lapply(jsonlite::fromJSON)

# look at metadata for an image
str(metadata[[6]])


## ---- eval=NOT_CRAN------------------------------------------------------
metadata[[6]]$'geo:lat'
metadata[[6]]$'geo:long'

## ---- eval=NOT_CRAN------------------------------------------------------
# wget gets a webpage and other files. 
# sys::exec_wait('wget', c('--page-requisites', 'https://tika.apache.org/'))
# Put it all into a .zip file 
# sys::exec_wait('zip', c('-r', 'tika.apache.org.zip' ,'tika.apache.org'))
batch <- system.file("extdata", "tika.apache.org.zip", package = "rtika")

# a list of data.frames
metadata <-
    batch %>% 
    tika_json() %>%
    lapply(jsonlite::fromJSON)

# The structure is very long. See it on your own with: str(metadata)


## ---- eval=NOT_CRAN------------------------------------------------------
# the 'X-TIKA:embedded_resource_path' field
embedded_resource_path <- 
    metadata %>%
    lapply(function(x){ x$'X-TIKA:embedded_resource_path' }) 

embedded_resource_path

## ---- eval=NOT_CRAN------------------------------------------------------
content_type <-
    metadata %>%
    lapply(function(x){ x$'Content-Type' }) 

content_type

## ---- eval=NOT_CRAN------------------------------------------------------
content <- 
     metadata %>%
    lapply(function(x){ x$'X-TIKA:content' })

str(content)


