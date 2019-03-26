library(repo)


### Name: repo_sys
### Title: Run system call on an item
### Aliases: repo_sys

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Creating a PDF file with a figure.
pdffile <- file.path(rp_path, "afigure.pdf")
pdf(pdffile)
plot(runif(30), runif(30))
dev.off()

## Attaching the PDF file to the repo
rp$attach(pdffile, "A plot of random numbers", "repo_sys")
## don't need the original PDF file anymore
file.remove(pdffile)

## Opening the stored PDF with Evince document viewer
## Not run: 
##D rp$sys("afigure.pdf", "evince")
## End(Not run)

## wiping temporary repo
unlink(rp_path, TRUE)



