testHelper <- function(c1, rds) {
  c2 <- readRDS(rds)

  c1n <- names(c1)
  c2n <- names(c2)
  cn <- intersect(c1n, c2n)
  c1c <- c1n[!c1n %in% cn]
  c2c <- c2n[!c2n %in% cn]
  if(length(c1c) > 0) {
    cat(paste0("Error: elements in c1, not in c2: ", paste(c1c, collapse=", "), "\n"))
  }
  if(length(c2c) > 0) {
    cat(paste0("Error: elements in c2, not in c1: ", paste(c2c, collapse=", "), "\n"))
  }
  for(i in 1:length(cn)) {
    ae <- all.equal(c1[[cn[i]]], c2[[cn[i]]])
    if(length(ae)==1 & ae[1]==TRUE) {

    } else {
      cat("name:",cn[i],"\n")
      cat("c1:\n")
      print(c1[[cn[i]]])
      cat("c2:\n")
      print(c2[[cn[i]]])
    }
  }

  c1 <- attributes(c1)
  c2 <- attributes(c2)
  c1n <- names(c1)
  c2n <- names(c2)
  cn <- intersect(c1n, c2n)
  c1c <- c1n[!c1n %in% cn]
  c2c <- c2n[!c2n %in% cn]
  if(length(c1c) > 0) {
    cat(paste0("Error: elements in c1 attributes, not in c2 attributes: ", paste(c1c, collapse=", "), "\n"))
  }
  if(length(c2c) > 0) {
    cat(paste0("Error: elements in c2 attributes, not in c1 attributes: ", paste(c2c, collapse=", "), "\n"))
  }
  for(i in 1:length(cn)) {
    ae <- all.equal(c1[[cn[i]]], c2[[cn[i]]])
    if(length(ae)==1 & ae[1]==TRUE) {

    } else {
      cat("attribute name:",cn[i],"\n")
      cat("c1:\n")
      print(c1[[cn[i]]])
      cat("c2:\n")
      print(c2[[cn[i]]])
    }
  }
}