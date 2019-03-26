## ---- eval=FALSE---------------------------------------------------------
#  if (!require(pafdR)){
#    install.packages('pafdR')
#    library(pafdR)
#  }
#  
#  my.lan <- 'en' # language of code and data ('en' or 'pt-br')
#  
#  # dl may take some time (around 60 mb)
#  pafdR_download.code.and.data(lan = my.lan)
#  
#  dir.out <- 'pafdR-en-code_data-master'
#  
#  # list R code
#  list.files(dir.out, pattern = '*.R')
#  list.files(paste0(dir.out,'/data'))

## ---- eval=FALSE---------------------------------------------------------
#  if (!require(pafdR)){
#    install.packages('pafdR')
#    library(pafdR)
#  }
#  
#  my.lan <- 'en' # language of exercises
#  my.exercise.folder <- 'pafdR-exercises' # name of folder with exercises files (will download from github)
#  my.pdf.folder <- 'PdfOut' # name of folder to place pdf file and answer sheet
#  
#  pafdR_build.exercise(lan = my.lan,
#                       exercise.folder = my.exercise.folder,
#                       pdf.folder = my.pdf.folder)
#  
#  list.files(my.pdf.folder)

