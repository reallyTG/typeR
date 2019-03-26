library(liftr)


### Name: render_docker
### Title: Render Containerized R Markdown Documents
### Aliases: render_docker drender

### ** Examples

# copy example file
dir_example = paste0(tempdir(), "/liftr-tidyverse/")
dir.create(dir_example)
file.copy(system.file("examples/liftr-tidyverse.Rmd", package = "liftr"), dir_example)

# containerization
input = paste0(dir_example, "liftr-tidyverse.Rmd")
lift(input)

## Not run: 
##D # print the Docker commands first
##D render_docker(input, dry_run = TRUE)
##D 
##D # render the document with Docker
##D render_docker(input)
##D 
##D # view rendered document
##D browseURL(paste0(dir_example, "liftr-tidyverse.pdf"))
##D 
##D # remove the generated Docker image
##D prune_image(paste0(dir_example, "liftr-tidyverse.docker.yml"))
## End(Not run)



