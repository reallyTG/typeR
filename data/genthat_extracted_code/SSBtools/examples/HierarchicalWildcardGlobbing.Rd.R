library(SSBtools)


### Name: HierarchicalWildcardGlobbing
### Title: Find variable combinations by advanced wildcard/globbing
###   specifications.
### Aliases: HierarchicalWildcardGlobbing

### ** Examples

                  
# useUnique=NULL betyr valg ut fra antall rader i kombinasjonsfil
data(precip)
data(mtcars)
codes <- as.character(c(100, 200, 300, 600, 700, 101, 102, 103, 104, 134, 647, 783, 
                        13401, 13402, 64701, 64702))


# Create list input
zList <- list(car = rownames(mtcars), wt = as.character(1000 * mtcars$wt), 
              city = names(precip), code = codes)

# Create data.frame input
m <- cbind(car = rownames(mtcars), wt = as.character(1000 * mtcars$wt))
zFrame <- data.frame(m[rep(1:NROW(m), each = 35), ], 
                     city = names(precip), code = codes, stringsAsFactors = FALSE)

# Create globbing/wildcards input
wg <- data.frame(rbind(c("Merc*", ""    , ""    , "?00"  ), 
                       c("F*"   , ""    , ""    , "?????"), 
                       c(""     , "???0", "C*"  , ""     ), 
                       c(""     , ""    , "!Co*", ""     ), 
                       c(""     , ""    , "?i*" , "????2"), 
                       c(""     , ""    , "?h*" , "????1")), 
           sign = c("+", "+", "+", "+", "-", "-"), stringsAsFactors = FALSE)
names(wg)[1:4] <- names(zList)



# =================================================================== 
#   Finding unique combinations present in the input data frame
# ===================================================================


# Using first row of wg. Combinations of car starting with Merc 
# and three-digit code ending with 00
HierarchicalWildcardGlobbing(zFrame[, c(1, 4)], wg[1, c(1, 4, 5)])

# Using first row of wg. Combinations of all four variables
HierarchicalWildcardGlobbing(zFrame, wg[1, ])

# More combinations when using second row also
HierarchicalWildcardGlobbing(zFrame, wg[1:2, ])

# Less combinations when using third row also 
# since last digit of wt must be 0 and only cities starting with C
HierarchicalWildcardGlobbing(zFrame, wg[1:3, ])


# Less combinations when using fourth row also since city cannot start with Co
HierarchicalWildcardGlobbing(zFrame, wg[1:4, ])

# Less combinations when using fourth row also 
# since specific combinations of city and code are removed
HierarchicalWildcardGlobbing(zFrame, wg)


# =================================================================== 
#  Using list input to create all possible combinations
# ===================================================================

dim(HierarchicalWildcardGlobbing(zList, wg))

# same result with as.list since same unique values of each variable
dim(HierarchicalWildcardGlobbing(as.list(zFrame), wg))



