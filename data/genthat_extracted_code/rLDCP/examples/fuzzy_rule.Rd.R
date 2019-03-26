library(rLDCP)


### Name: fuzzy_rule
### Title: Define the fuzzy rule
### Aliases: fuzzy_rule

### ** Examples

# For example, the rule "IF CPtemp IS warm THEN CPcomfort IS very comfortable"
#is coded as:

 fuzzy_rule(0,1,0,0,0,1)

# Where, the first three values (0,1,0) correspond with the linguistic
# expressions Atemp=(cold, warm, hot) that define the room temperature (CPtemp).
# The last three values (0,0,1) are related to the linguistic expressions
# Acomfort=(uncomfortable, comfortable and very comfortable) that define
# the room comfort (CPcomfort).
#



