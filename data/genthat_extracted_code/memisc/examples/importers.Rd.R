library(memisc)


### Name: importers
### Title: Object Oriented Interface to Foreign Files
### Aliases: importer importer-class spss.portable.file
###   spss.portable.importer-class show,spss.portable.importer-method
###   spss.system.file spss.system.importer-class
###   show,spss.system.importer-method spss.fixed.file
###   spss.fixed.importer-class show,spss.fixed.importer-method Stata.file
###   Stata.importer-class show,Stata.importer-method
###   as.data.set,importer-method subset,importer-method
###   dim,importer-method names,importer-method
###   [,importer,atomic,atomic,ANY-method
###   [,importer,atomic,missing,ANY-method
###   [,importer,missing,atomic,ANY-method
###   [,importer,missing,missing,ANY-method
###   initialize,spss.portable.importer-method
###   initialize,spss.system.importer-method
###   initialize,spss.fixed.importer-method
###   initialize,Stata.importer-method
### Keywords: file

### ** Examples

# Extract American National Election Study of 1948
nes1948.por <- unzip(system.file("anes/NES1948.ZIP",package="memisc"),
                     "NES1948.POR",exdir=tempfile())

# Get information about the variables contained.
nes1948 <- spss.portable.file(nes1948.por)

# The data are not yet loaded:
show(nes1948)

# ... but one can see what variables are present:
description(nes1948)

# Now a subset of the data is loaded:
vote.socdem.48 <- subset(nes1948,
              select=c(
                  v480018,
                  v480029,
                  v480030,
                  v480045,
                  v480046,
                  v480047,
                  v480048,
                  v480049,
                  v480050
                  ))

# Let's make the names more descriptive:
vote.socdem.48 <- rename(vote.socdem.48,
                  v480018 = "vote",
                  v480029 = "occupation.hh",
                  v480030 = "unionized.hh",
                  v480045 = "gender",
                  v480046 = "race",
                  v480047 = "age",
                  v480048 = "education",
                  v480049 = "total.income",
                  v480050 = "religious.pref"
        )

# It is also possible to do both
# in one step:
# vote.socdem.48 <- subset(nes1948,
#              select=c(
#                  vote           = v480018,
#                  occupation.hh  = v480029,
#                  unionized.hh   = v480030,
#                  gender         = v480045,
#                  race           = v480046,
#                  age            = v480047,
#                  education      = v480048,
#                  total.income   = v480049,
#                  religious.pref = v480050
#                  ))



# We examine the data more closely:
codebook(vote.socdem.48)

# ... and conduct some analyses.
#
t(genTable(percent(vote)~occupation.hh,data=vote.socdem.48))

# We consider only the two main candidates.
vote.socdem.48 <- within(vote.socdem.48,{
  truman.dewey <- vote
  valid.values(truman.dewey) <- 1:2
  truman.dewey <- relabel(truman.dewey,
              "VOTED - FOR TRUMAN" = "Truman",
              "VOTED - FOR DEWEY"  = "Dewey")
  })

summary(truman.relig.glm <- glm((truman.dewey=="Truman")~religious.pref,
    data=vote.socdem.48,
    family="binomial",
))



