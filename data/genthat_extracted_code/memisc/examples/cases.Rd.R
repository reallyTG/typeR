library(memisc)


### Name: cases
### Title: Distinguish between Cases Specified by Logical Conditions
### Aliases: cases
### Keywords: manip

### ** Examples

# Examples of the first kind of usage of the function
#
df <- data.frame(x = rnorm(n=20), y = rnorm(n=20))
df <- df[do.call(order,df),]
(df <- within(df,{
  x1=cases(x>0,x<=0)
  y1=cases(y>0,y<=0)
  z1=cases(
    "Condition 1"=x<0,
    "Condition 2"=y<0,# only applies if x >= 0
    "Condition 3"=TRUE
    )
  z2=cases(x<0,(x>=0 & y <0), (x>=0 & y >=0))
  }))
xtabs(~x1+y1,data=df)
dd <- with(df,
  try(cases(x<0,
            x>=0,
            x>1,
            check.xor=TRUE)# let's be fussy
            )
  )
dd <- with(df,
  try(cases(x<0,x>=0,x>1))
  )
genTable(range(x)~dd,data=df)

# An example of the second kind of usage of the function:
# A construction of a non-smooth function
#
fun <- function(x)
  cases(
    x==0      -> 1,
    abs(x)> 1 -> abs(x),
    abs(x)<=1 -> x^2
  )
x <- seq(from=-2,to=2,length=101)
plot(fun(x)~x)



