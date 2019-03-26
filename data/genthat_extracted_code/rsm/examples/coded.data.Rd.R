library(rsm)


### Name: coded.data
### Title: Functions for coded data
### Aliases: coded.data as.coded.data decode.data recode.data is.coded.data
###   val2code code2val print.coded.data [.coded.data codings
###   codings.coded.data codings<- names<-.coded.data truenames
###   truenames.coded.data truenames<- truenames<-.coded.data
### Keywords: regression design

### ** Examples

library(rsm)

### Existing dataset with variables on actual scale
CR <- coded.data (ChemReact, x1 ~ (Time - 85)/5, x2 ~ (Temp - 175)/5)
CR                            # same as print(CR, decode = TRUE)
print(CR, decode = FALSE)     # similar to as.data.frame(CR)
code2val (c(x1=.5, x2=-1), codings = codings(CR))

### Existing dataset, already in coded form
CO <- as.coded.data(codata, x1 ~ (Ethanol - 0.2)/0.1, x2 ~ A.F.ratio - 15)
truenames(CO)
names(CO)

# revert x2 to an uncoded variable
codings(CO)[2] <- NULL
truenames(CO)

### Import a design that is coded in a different way

if (require(conf.design)) { # ----- This example requires conf.design -----

# First, generate a 3^3 in blocks and import it via coded.data
    des3 <- coded.data(conf.design(p=3, G=c(1,1,2)))
    # NOTE: This returns a warning message but does the right thing --
    # It generates these names and coding formulas automatically:
    #   x1 ~ (T1 - 2)/1
    #   x2 ~ (T2 - 2)/1
    #   x3 ~ (T3 - 2)/1
# Now randomize and change the codings and variable names for the real situation:
    mydes <- dupe(des3, coding = c(x1 ~ (Dose - 20)/5,  x2 ~ (Conc - 40)/10,  
                                x3 ~ (Time - 60)/15))
                                
} # ----- end of example requiring package conf.design -----




