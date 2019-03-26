library(annotate)


### Name: htmlpage
### Title: Functions to build HTML pages
### Aliases: htmlpage
### Keywords: manip

### ** Examples

  ## A very simple example. Two columns, one with links, the other without.

  gos <- paste("GO:000000", 1:9, sep="")
  notlinks <- LETTERS[1:9]

  htmlpage(list(gos), "simple.html", "Two column data", list(notlinks),
           c("GO IDs", "Letters"), repository = list("go"))

  if(!interactive())
    file.remove("simple.html")

  ## A more complex example with multiple links per cell
  ## first we create data to annotate
  unigene <- list("Hs.600536",c("Hs.596913","HS.655491"),"Hs.76704")
  refseq <- list(c("NM_001030050", "NM_001030047", "NM_001648",
  "NM_001030049"), "NM_000860", c("NM_001011645", "NM_000044"))
  entrez <- c("354", "3248", "367")
  genelist <- list(unigene, refseq, entrez)

  ## now some other data

  symb <- c("KLK3","HPGD","AR")
  desc <- c("Prostate-specific antigen precursor",
            "15-hydroxyprostaglandin dehydrogenase",
            "Androgen receptor")
  t.stat <- c(40.21, -22.14, 21.56)
  p.value <- rep(0,3)
  fold.change <- c(3.54, -2.35, 3.18)
  expression <- matrix(c(11.78, 11.69, 11.62, 8.17, 5.78, 5.58, 5.68,
                         8.26, 9.08, 9.28, 9.19, 6.05), ncol=4, byrow=TRUE)

  otherdata <- list(symb, desc, t.stat, p.value, fold.change, expression)
  table.head <- c("UniGene", "RefSeq", "EntrezGene", "Symbol",
                  "Description", "t-stat", "p-value", "fold change",
                  paste("Sample", 1:4))

  htmlpage(genelist, "test.html", "Some gene expression data", otherdata,
           table.head, repository = list("ug","gb","en"))

  if(!interactive())
    file.remove("test.html")



