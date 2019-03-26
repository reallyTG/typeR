library(meta)


### Name: forest
### Title: Forest plot to display the result of a meta-analysis
### Aliases: forest forest.meta forest.metabind
### Keywords: hplot

### ** Examples

data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Olkin95, subset=c(41,47,51,59),
                 sm="RR", method="I",
                 studlab=paste(author, year))


## Not run: 
##D #
##D # Do standard (symmetric) forest plot
##D #
##D forest(meta1)
## End(Not run)


#
# Layout of forest plot similar to Review Mananager 5
# (see http://community.cochrane.org/tools/review-production-tools/revman-5)
#
# Furthermore, add labels on both sides of forest plot and prediction
# interval
#
forest(meta1, layout="RevMan5", comb.fixed=FALSE,
       label.right="Favours control", col.label.right="red",
       label.left="Favours experimental", col.label.left="green",
       prediction=TRUE)


## Not run: 
##D #
##D # Sort studies by decreasing treatment effect within year subgroups
##D #
##D meta2 <- update(meta1, byvar=ifelse(year < 1987,
##D                                     "Before 1987", "1987 and later"),
##D                 print.byvar=FALSE)
##D forest(meta2,
##D        sortvar=-TE, comb.random=FALSE)
##D 
##D 
##D #
##D # Forest plot specifying argument xlim
##D #
##D forest(meta1, xlim=c(0.01, 10))
##D 
##D 
##D #
##D # Print results of test for overall effect
##D #
##D forest(meta1, test.overall.fixed=TRUE, test.overall.random=TRUE)
##D 
##D 
##D #
##D # Forest plot with 'classic' layout used in
##D # R package meta, version < 1.6-0
##D #
##D forest(meta1, col.square="black", hetstat=FALSE)
##D 
##D 
##D #
##D # Change set of columns printed on left side
##D # of forest plot
##D #
##D forest(meta1, comb.random=FALSE,
##D        leftcols="studlab")
##D 
##D 
##D #
##D # Do not print columns on right side of forest plot
##D #
##D forest(meta1, rightcols=FALSE)
##D 
##D 
##D #
##D # Change study label to "Author"
##D #
##D forest(meta1, comb.random=FALSE,
##D        leftlabs=c("Author", NA, NA, NA, NA))
##D 
##D 
##D #
##D # Just give effect estimate and 95##D 
##D # on right side of forest plot (in one column)
##D #
##D forest(meta1, rightcols=c("effect.ci"))
##D 
##D 
##D #
##D # Just give effect estimate and 95##D 
##D # on right side of forest plot
##D #
##D forest(meta1, rightcols=c("effect", "ci"))
##D 
##D 
##D #
##D # 1. Change order of columns on left side
##D # 2. Attach labels to columns 'event.e' and 'event.c'
##D #    instead of columns 'n.e' and 'n.c'
##D #
##D forest(meta1,
##D        leftcols=c("studlab", "n.e", "event.e", "n.c", "event.c"),
##D        lab.e.attach.to.col="event.e",
##D        lab.c.attach.to.col="event.c")
##D 
##D 
##D #
##D # Specify column labels only for newly created variables
##D # 'year' and 'author' (which are part of dataset Olkin95)
##D #
##D forest(meta1,
##D        leftcols=c("studlab", "event.e", "n.e", "event.c", "n.c",
##D                   "author", "year"),
##D        leftlabs=c("Author", "Year of Publ"))
##D 
##D 
##D #
##D # Center text in all columns
##D #
##D forest(meta1,
##D        leftcols=c("studlab", "event.e", "n.e", "event.c", "n.c",
##D                   "author", "year"),
##D        leftlabs=c("Author", "Year of Publ"), hetstat=FALSE,
##D        just="center", just.addcols="center", just.studlab="center")
##D 
##D #
##D # Same result
##D #
##D forest(meta1,
##D        leftcols=c("studlab", "event.e", "n.e", "event.c", "n.c",
##D                   "author", "year"),
##D        leftlabs=c("Author", "Year of Publ"), hetstat=FALSE,
##D        just="c", just.addcols="c", just.studlab="c")
##D 
##D 
##D #
##D # Change some fontsizes and fontfaces
##D #
##D forest(meta1,
##D        fs.study=10, ff.study="italic",
##D        fs.study.label=11, ff.study.label="bold",
##D        fs.axis=5, ff.axis="italic",
##D        ff.smlab="bold.italic",
##D        ff.fixed="plain", ff.hetstat="plain")
##D 
##D 
##D #
##D # Change some colours
##D #
##D forest(meta1,
##D        col.diamond="green", col.diamond.lines="red",
##D        col.study=c("green", "blue", "red", "orange"),
##D        col.square="pink", col.square.lines="black")
##D 
##D 
##D #
##D # Sort by weight in fixed effect model
##D #
##D forest(meta1, sortvar=1/w.fixed, comb.random=FALSE)
##D 
##D 
##D #
##D # Sort by decreasing weight in fixed effect model
##D #
##D forest(meta1, sortvar=-1/w.fixed, comb.random=FALSE)
##D 
##D 
##D #
##D # Sort by size of treatment effect
##D #
##D forest(meta1, sortvar=TE, comb.random=FALSE)
##D 
##D 
##D #
##D # Sort by size of treatment effect
##D #
##D forest(meta1, sortvar=-TE, comb.random=FALSE)
##D 
##D 
##D #
##D # Sort by decreasing year of publication
##D #
##D forest(meta1, sortvar=-year, comb.random=FALSE)
##D 
##D 
##D #
##D # Print results of test for subgroup differences (random effects model)
##D #
##D forest(meta2,
##D        sortvar=-TE, comb.fixed=FALSE,
##D        test.subgroup.random=TRUE)
##D 
##D #
##D # Print only subgroup results
##D #
##D forest(meta2, layout="subgroup")
##D 
##D #
##D # Print only subgroup results
##D # (and consider text for heterogeneity measures in width of subgroup
##D #  column)
##D #
##D forest(meta2, layout="subgroup", calcwidth.hetstat=TRUE)
## End(Not run)



