library(liftr)


### Name: lift
### Title: Containerize R Markdown Documents
### Aliases: lift

### ** Examples

# copy example file
dir_example = paste0(tempdir(), '/liftr-minimal/')
dir.create(dir_example)
file.copy(system.file("examples/liftr-minimal.Rmd", package = "liftr"), dir_example)

# containerization
input = paste0(dir_example, "liftr-minimal.Rmd")
lift(input)

## Not run: 
##D # render the document with Docker
##D render_docker(input)
##D 
##D # view rendered document
##D browseURL(paste0(dir_example, "liftr-minimal.html"))
##D 
##D # purge the generated Docker image
##D purge_image(paste0(dir_example, "liftr-minimal.docker.yml"))
## End(Not run)



