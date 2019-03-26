library(geotopbricks)


### Name: argsParser
### Title: Parser of an argument string
### Aliases: argsParser

### ** Examples


args <- "--value  6  --fruit apple"

option <- "--fruit"

value <- argsParser(option=option,args=args)

option2 <- "--jobs"

value2 <- argsParser(option=option2,args=args)
value22 <- argsParser(option=option2,args=args,novalue_response="./")
 args_b <- "value=6 , fruit=apple"

value <- argsParser(option=option,args=args_b,sep=c(",","="))




