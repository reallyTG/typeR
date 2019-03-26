library(BioInstaller)


### Name: docker.pull
### Title: Use docker to pull image
### Aliases: docker.pull

### ** Examples

docker.bin <- unname(Sys.which('docker'))
if (docker.bin != '') {
  docker.pull(repo = 'learn', name = 'tutorial')
}



