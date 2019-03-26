all_files <- list.files("testthat",full.names=T,pattern="*.R$")

sapply(all_files,source)