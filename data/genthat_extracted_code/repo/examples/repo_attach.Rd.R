library(repo)


### Name: repo_attach
### Title: Create a new item from an existing file.
### Aliases: repo_attach

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Not run: 
##D ## Creating a PDF file with a figure.
##D pdf("afigure.pdf")
##D ## Drawing a random plot in the figure
##D plot(runif(100), runif(100))
##D dev.off()
##D ## Attaching the PDF file to the repo
##D rp$attach("afigure.pdf", "A plot of random numbers", "repo_sys")
##D ## don't need the PDF file anymore
##D file.remove("afigure.pdf")
##D ## Opening the stored PDF with Evince document viewer
##D rp$sys("afigure.pdf", "evince")
## End(Not run)

## wiping temporary repo
unlink(rp_path, TRUE)



