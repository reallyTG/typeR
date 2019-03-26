library(ips)


### Name: read.fas
### Title: Read DNA Sequences
### Aliases: read.fas read.nex read.phy

### ** Examples

## bark beetle COX1 sequences
## --------------------------
data(ips.cox1)

## create temporary file names
## ---------------------------
format <- c(".fas", ".phy", ".nex")
fn <- sapply(format, tempfile, 
  pattern = "ips", tmpdir = tempdir())

## write sequences files
## ---------------------
write.fas(ips.cox1, fn[".fas"])
write.phy(ips.cox1, fn[".phy"])
write.nex(ips.cox1, fn[".nex"])

## read sequence files
## -------------------
fas <- read.fas(fn[".fas"])
phy <- read.phy(fn[".phy"])
nex <- read.nex(fn[".nex"])

## remove sequence files
## ---------------------
unlink(fn)



