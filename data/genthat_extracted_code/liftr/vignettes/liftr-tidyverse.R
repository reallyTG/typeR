## ---- eval = FALSE-------------------------------------------------------
#  path = paste0("~/liftr-tidyverse/")
#  
#  dir.create(path)
#  file.copy(system.file("examples/liftr-tidyverse.Rmd", package = "liftr"), path)
#  
#  input = paste0(path, "liftr-tidyverse.Rmd")

## ---- eval = FALSE-------------------------------------------------------
#  lift(input)

## ---- eval = FALSE-------------------------------------------------------
#  render_docker(input)

## ---- eval = FALSE-------------------------------------------------------
#  browseURL(paste0(path, "liftr-tidyverse.pdf"))

## ---- eval = FALSE-------------------------------------------------------
#  prune_image(paste0(path, "liftr-tidyverse.docker.yml"))

