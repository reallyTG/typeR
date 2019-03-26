library(rdhs)


### Name: rbind_labelled
### Title: Combine data frames with columns of class 'labelled'
### Aliases: rbind_labelled

### ** Examples

df1 <- data.frame(
area = haven::labelled(c(1L, 2L, 3L), c("reg 1"=1,"reg 2"=2,"reg 3"=3)),
climate = haven::labelled(c(0L, 1L, 1L), c("cold"=0,"hot"=1))
)
df2 <- data.frame(
area    = haven::labelled(c(1L, 2L), c("reg A"=1, "reg B"=2)),
climate = haven::labelled(c(1L, 0L), c("cold"=0, "warm"=1))
)

# Default: all data frames inherit labels from first df. Incorrect if
# "reg 1" and "reg A" are from different countries, for example.
dfA <- rbind_labelled(df1, df2)
haven::as_factor(dfA)

# Concatenate value labels for "area". Regions are coded separately,
# and original integer values are lost (by necessity of more levels now).
# For "climate", codes "1 = hot" and "1 = warm", are coded as the same
# outcome, inheriting "1 = hot" from df1 by default.
dfB <- rbind_labelled(df1, df2, labels=list(area = "concatenate"))
dfB
haven::as_factor(dfB)

# We can specify to code as "1=warm/hot" rather than inheriting "hot".
dfC <- rbind_labelled(df1, df2,
labels=list(area = "concatenate", climate = c("cold"=0, "warm/hot"=1)))

dfC$climate
haven::as_factor(dfC)

# Or use `climate="concatenate"` to code "warm" and "hot" as different.
dfD <- rbind_labelled(df1, df2,
labels=list(area = "concatenate", climate="concatenate"))

dfD
haven::as_factor(dfD)




