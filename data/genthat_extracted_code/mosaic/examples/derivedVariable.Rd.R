library(mosaic)


### Name: derivedVariable
### Title: Create new variables from logicals
### Aliases: derivedVariable derivedFactor

### ** Examples

Kf <- mutate(KidsFeet, biggerfoot2 = derivedFactor(
                   dom = biggerfoot == domhand,
                   nondom = biggerfoot != domhand)
                   )
tally( ~ biggerfoot + biggerfoot2, data = Kf)
tally( ~ biggerfoot + domhand, data = Kf)

# Three equivalent ways to define a new variable
# Method 1: explicitly define all levels
modHELP <- mutate(HELPrct, drink_status = derivedFactor( 
  abstinent = i1 == 0,
  moderate = (i1>0 & i1<=1 & i2<=3 & sex=='female') |
     (i1>0 & i1<=2 & i2<=4 & sex=='male'),
  highrisk = ((i1>1 | i2>3) & sex=='female') | 
      ((i1>2 | i2>4) & sex=='male'),
  .ordered = TRUE)
)
tally( ~ drink_status, data = modHELP)

# Method 2: Use .default for last level
modHELP <- mutate(HELPrct, drink_status = derivedFactor( 
  abstinent = i1 == 0,
  moderate = (i1<=1 & i2<=3 & sex=='female') |
     (i1<=2 & i2<=4 & sex=='male'),
  .ordered = TRUE,
  .method = "first",
  .default = "highrisk")
)
tally( ~ drink_status, data = modHELP)

# Method 3: use TRUE to catch any fall through slots
modHELP <- mutate(HELPrct, drink_status = derivedFactor( 
  abstinent = i1 == 0,
  moderate = (i1<=1 & i2<=3 & sex=='female') |
     (i1<=2 & i2<=4 & sex=='male'),
  highrisk=TRUE,
  .ordered = TRUE,
  .method = "first"
  )
)
tally( ~ drink_status, data = modHELP)
is.factor(modHELP$drink_status)

modHELP <- mutate(HELPrct, drink_status = derivedVariable( 
  abstinent = i1 == 0,
  moderate = (i1<=1 & i2<=3 & sex=='female') |
     (i1<=2 & i2<=4 & sex=='male'),
  highrisk=TRUE,
  .ordered = TRUE,
  .method = "first"
  )
)
is.factor(modHELP$drink_status)



