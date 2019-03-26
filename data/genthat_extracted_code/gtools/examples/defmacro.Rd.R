library(gtools)


### Name: defmacro
### Title: Define a macro
### Aliases: defmacro strmacro
### Keywords: programming

### ** Examples

####
# macro for replacing a specified missing value indicator with NA
# within a dataframe
###
setNA <- defmacro(df, var, values,
                  expr={
                         df$var[df$var %in% values] <- NA
                       })

# create example data using 999 as a missing value indicator
d <- data.frame(
   Grp=c("Trt", "Ctl", "Ctl", "Trt", "Ctl", "Ctl", "Trt", "Ctl", "Trt", "Ctl"),
   V1=c(1, 2, 3, 4, 5, 6, 999, 8,   9,  10),
   V2=c(1, 1, 1, 1, 1, 2, 999, 2, 999, 999)
               )
d

# Try it out
setNA(d, V1, 999)
setNA(d, V2, 999)
d


###
# Expression macro
###
plot.d <- defmacro( df, var, DOTS, col="red", title="", expr=
  plot( df$var ~ df$Grp, type="b", col=col, main=title, ... )
)

plot.d( d, V1)
plot.d( d, V1, col="blue" )
plot.d( d, V1, lwd=4)  # use optional 'DOTS' argument

###
# String macro (note the quoted text in the calls below)
#
# This style of macro can be useful when you are reading
# function arguments from a text file
###
plot.s <- strmacro( DF, VAR, COL="'red'", TITLE="''", DOTS="", expr=
  plot( DF$VAR ~ DF$Grp, type="b", col=COL, main=TITLE, DOTS)
)

plot.s( "d", "V1")
plot.s( DF="d", VAR="V1", COL='"blue"' )
plot.s( "d", "V1", DOTS='lwd=4')  # use optional 'DOTS' argument



#######
# Create a macro that defines new functions
######
plot.sf <- defmacro(type='b', col='black',
                    title=deparse(substitute(x)), DOTS, expr=
  function(x,y) plot( x,y, type=type, col=col, main=title, ...)
)

plot.red  <- plot.sf(col='red',title='Red is more Fun!')
plot.blue <- plot.sf(col='blue',title="Blue is Best!", lty=2)

plot.red(1:100,rnorm(100))
plot.blue(1:100,rnorm(100))





