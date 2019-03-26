library(matR)


### Name: image.biom
### Title: Display heatmap of BIOM data with optional dendrograms
### Aliases: image image.biom

### ** Examples

####  simple heatmap; using log transformation makes interesting things more apparent
image (xx2)
xx2t <- transform (xx2, t_Log)
image (xx2t, labCol="$$project.id")

####  clustering analysis restricted to Archaea
image (xx2t, labCol="$$project.id", rows=rows(xx2t,"taxonomy1")=="Archaea")

####  clustering analysis restricted by significance test p values
p <- rowstats (xx2t, test="t-test-unpaired", groups="$$material") $ p.value
p [is.na(p)] <- p [is.nan(p)] <- FALSE
image (xx2t [rows = p < 0.05, ], labCol="$$material")



