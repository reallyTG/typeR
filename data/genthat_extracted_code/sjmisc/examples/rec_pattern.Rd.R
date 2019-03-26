library(sjmisc)


### Name: rec_pattern
### Title: Create recode pattern for 'rec' function
### Aliases: rec_pattern

### ** Examples

rp <- rec_pattern(1, 100)
rp

# sample data, inspect age of carers
data(efc)
table(efc$c160age, exclude = NULL)
table(rec(efc$c160age, rec = rp$pattern), exclude = NULL)

# recode carers age into groups of width 5
x <- rec(
  efc$c160age,
  rec = rp$pattern,
  val.labels = rp$labels
)
# watch result
frq(x)




