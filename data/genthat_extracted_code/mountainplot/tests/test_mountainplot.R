
context("test_mountainplot.R")

require(mountainplot)

# prepare data for tests
data(singer, package = "lattice")
singer <- within(singer, {
  section <- voice.part
  section <- gsub(" 1", "", section)
  section <- gsub(" 2", "", section)
  section <- factor(section)
})

# ----------------------------------------------------------------------------

# For some reason, I cannot get covr to recognize that I'm calling
# panel.mountainplot

test_that("mountainplot.numeric", {
  mountainplot(1:20)
  expect_warning(mountainplot(1:20, data=singer))
})

test_that("mountainplot.formula", {
  # labels
  mountainplot( ~ height, singer,
               main="Folded Empirical CDF",
               xlab="Singer height",ylab="Folded ECDF")
  # line types
  mountainplot( ~ height, singer) # default type='s'
  mountainplot( ~ height, singer, type='l')
  mountainplot( ~ height, singer, type='p')
  mountainplot( ~ height, singer, type='b') # l + p
  # multi-panel
  mountainplot( ~ height|voice.part, singer, type='s')
  # multi-group
  mountainplot( ~ height, singer, type='s', group=section)
  # panel/group
  mountainplot( ~ height|section, singer, groups=voice.part, type='l',
               auto.key=list(columns=4))
  # not really sensible, just testing 'scales'
  mountainplot( ~ height|voice.part, singer, type='l',
               scales=list(x=list(relation="free")))
})

test_that("mountainplot.panel", {
  mountainplot(~height, singer, panel=mountainplot::panel.mountainplot)
})
