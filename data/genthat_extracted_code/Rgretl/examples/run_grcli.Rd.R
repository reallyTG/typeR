library(Rgretl)


### Name: run_grcli
### Title: running gretl scripts
### Aliases: run_grcli

### ** Examples

# The differences with the native gretl script are:
# (i) name of character vector (gr.script <- here)
# (ii) quotes: for make hansl code a character string;
#      quotes inside script should be escaped, e.g. 
#      text <- "eval \"hello, word\""
gr.script <- 
"open denmark.gdt -q
ols diff(LRY) 0 diff(LRM) IBO --simple-print
restrict --silent
b[2] + b[3] = 0.3
end restrict
pv = $pvalue
if pv > 0.05
restrict --full
b[2] + b[3] = 0.3
end restrict
set warnings off
modtest --white-nocross 
endif"
run_grcli(gr.script)

Rz = run_grcli('print w v x\n eval x**y\n z = mexp(y)\n print z',
           input = list(matr = list(w = 1,v = 1:4, x= matrix(1:2,1),
           y = matrix(rep(1,9),3))),
           output = list(matr = "z"))
Rz$z

## Not run: 
##D # After gretl is properly installed one can
##D # safely copy-past and run this example
##D 
##D scr <-
##D "nulldata 10
##D set seed 13
##D series y = normal()
##D matrix x = seq(1,7)
##D matrix z = mshape({y},5,2)
##D string str = \"Hello, user!\"
##D print str"
##D ou <- run_grcli(scr,output = list(matr=c("x","z"),char="str",series = "y"))
##D ou
## End(Not run)



