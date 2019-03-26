library(recoder)


### Name: recoder
### Title: Simple and Handy Recoder
### Aliases: recoder
### Keywords: recode

### ** Examples

u = rnorm(1000)
u.2 = recoder(u,'<-2: -2; >2 : 2' ,other = 0)
plot(u,u.2)

# use a function of 'x' for assigning new values based on old values
u.3 = recoder(u,'<-2: -2; >2 : 2; >=-2 & <=2 : $^3/4') 
# NOTE: instructions in recode are executed from left to right
# So u.3 and u.4 are the same
u.4 = recoder(u,'<-2: -2; >=-2 : $^3/4;  >2 : 2')
plot(u, u.3)

# another example of a piecewise defined function
x = runif(1000,-1,10)
y = recoder(x,'>0 & <1: sqrt($); >=1 : 1+log($)' ,other=NA) 
plot(y~x)
table(is.na(y))

# we can also create other types of variables
k = rpois(n = 10000, lambda = 3)
evodd = recoder(k %% 2, '0: "even"; 1: "odd" ')
table(evodd)

# the output could also be made a factor, etc., using "as.what" argument
evodd.factor = recoder(k %% 2, '0: "even"; 1: "odd" ', as.what='factor')

# characters are recoded similarly
str = c('a','b','x','z',NA) 
str2 = recoder(str, '"x":"c"; "z":"d" ')
str3 = recoder(str, '"a":1; "b":2; "x":3; "z":4 ')
print(str3) #note that this is still not numeric
num3 = recoder(str, '"a":1; "b":2; "x":3; "z":4 ', as.what='numeric')
print(num3)

# when input is a factor, the levels are fixed
f1 = factor( c('a','b','x','z',NA)  )
f2 = recoder( f1, '"x":"a"; "z":"b" ')

## Not run: 
##D f3 = recoder(f1, '"x":"c"; "z":"d" ') # "c" and "d" are not recognized
## End(Not run)
f3 = recoder( as.character(f1), '"x":"c"; "z":"d" ' , as.what= "factor")



