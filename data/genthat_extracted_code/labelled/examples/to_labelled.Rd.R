library(labelled)


### Name: to_labelled
### Title: Convert to labelled data
### Aliases: to_labelled to_labelled.data.frame to_labelled.list
###   to_labelled.data.set to_labelled.importer foreign_to_labelled
###   memisc_to_labelled to_labelled.factor

### ** Examples

## Not run: 
##D   # from foreign
##D   library(foreign)
##D   df <- to_labelled(read.spss(
##D     'file.sav',
##D     to.data.frame = FALSE,
##D     use.value.labels = FALSE,
##D     use.missings = FALSE
##D  ))
##D  df <- to_labelled(read.dta(
##D    'file.dta',
##D    convert.factors = FALSE
##D  ))
##D 
##D  # from memisc
##D  library(memisc)
##D  nes1948.por <- UnZip('anes/NES1948.ZIP', 'NES1948.POR', package='memisc')
##D  nes1948 <- spss.portable.file(nes1948.por)
##D  df <- to_labelled(nes1948)
##D  ds <- as.data.set(nes19480)
##D  df <- to_labelled(ds)
## End(Not run)

# Converting factors to labelled vectors
f <- factor(c("yes", "yes", "no", "no", "don't know", "no", "yes", "don't know"))
to_labelled(f)
to_labelled(f, c("yes" = 1, "no" = 2, "don't know" = 9))
to_labelled(f, c("yes" = 1, "no" = 2))
to_labelled(f, c("yes" = "Y", "no" = "N", "don't know" = "DK"))

s1 <- labelled(c('M', 'M', 'F'), c(Male = 'M', Female = 'F'))
labels <- val_labels(s1)
f1 <- to_factor(s1)
f1

to_labelled(f1)
identical(s1, to_labelled(f1))
to_labelled(f1, labels)
identical(s1, to_labelled(f1, labels))



