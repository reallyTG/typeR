library(rchallenge)


### Name: publish
### Title: Render your challenge R Markdown script to a HTML page.
### Aliases: publish

### ** Examples

path <- tempdir()
wd <- setwd(path)
new_challenge()
outdir = tempdir()
publish(output_dir = outdir, output_options = list(self_contained = FALSE))
unlink(outdir)
setwd(wd)
unlink(path)



