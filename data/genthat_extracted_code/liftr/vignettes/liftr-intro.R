## ---- eval = FALSE-------------------------------------------------------
#  path = "~/liftr-minimal/"
#  dir.create(path)
#  file.copy(system.file("examples/liftr-minimal.Rmd", package = "liftr"), path)

## ---- eval = FALSE-------------------------------------------------------
#  library("liftr")
#  
#  input = paste0(path, "liftr-minimal.Rmd")
#  lift(input)

## ---- eval = FALSE-------------------------------------------------------
#  render_docker(input)

## ---- eval = FALSE-------------------------------------------------------
#  purge_image(paste0(path, "liftr-minimal.docker.yml"))

