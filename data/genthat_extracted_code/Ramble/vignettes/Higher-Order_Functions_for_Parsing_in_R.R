## ----closure-example-----------------------------------------------------
power <- function(exponent) {
  function(x) {
    x ^ exponent
  }
}
square <- power(2)
square(2)
cube <- power(3)
cube(2)

## ---- succeed------------------------------------------------------------
succeed <- function(string) {
  return(function(nextString) {
    return(list(result = string, leftover=nextString))
  })
}
succeed("1") ("abc")

## ---- item---------------------------------------------------------------
item <- function(...){
  return(function(string){
    if(length(string)==0){return(NULL)}
    return (if(string=="") list() else list(result=substr(string, 1, 1), leftover=substring(string, 2)))
  })
}
item() ("abc")

## ---- satisfy------------------------------------------------------------
satisfy <- function(p) {
  return(function(string) {
    if (length(string)==0) {
      return(list())
    }
    else if (string==""){
      return(list())
    }
    else {
      result_ = list(result=substr(string, 1, 1), leftover=substring(string, 2))
      if (p(result_$result)) {
        return(succeed(result_$result)(result_$leftover))
      }
      else{
        return(list())
      }
    }    
  })
}
satisfy(function(x) {x == "a"}) ("abc")

## ---- literal------------------------------------------------------------
literal <- function(char) {
  satisfy(function(x){return(x==char)})
}
literal("a") ("abc")

## ---- alt----------------------------------------------------------------
alt <- function(p1, p2) {
  return(function(string){
    result <- p1 (string)
    if(!is.null(result$leftover)) {return(result)}
    else{
      return(p2 (string))
    }
  })
}
`%alt%` <- alt
(item() %alt% succeed("2"))("abcdef")
alt(item(), succeed("2")) ("abcdef")

## ---- then---------------------------------------------------------------
then <- function(p1, p2) {
  return(function(string) {
    result <- p1 (string)
    if (length(result) == 0) {
      return (list())
    }
    else {
      result_ <- p2 (result$leftover)
      if (length(result_$leftover) == 0 || is.null(result_$leftover)) {return(list())}
      return(list(result=append(list(result$result), result_$result), leftover=result_$leftover))
    }
  })
}
`%then%` <- then
(literal("a") %then% literal("b")) ("abc")

## ---- using--------------------------------------------------------------
using <- function(p, f) {
  return(function(string) {
    result <- p (string) 
    if(length(result) == 0) {return(list())}
    return(list(result=f(result$result),
                leftover=result$leftover))
  })
}
`%using%` <- using
(item() %using% function(x) {as.numeric(x) + 100}) ("1abc")

## ---- many---------------------------------------------------------------
many <- function(p) {
  return(function(string) {
    ((p %then% many(p)) %alt% succeed(NULL)) (string)
  })
}
many(literal("1")) ("111223")

## ---- some---------------------------------------------------------------
some <- function(p) {
  return(function(string){
    (p %then% many(p)) (string)
  })
}
some(literal("a"))("aaabbc")

## ---- derived------------------------------------------------------------
Digit <- function(...) {satisfy(function(x) {return(!!length(grep("[0-9]", x)))})}
Lower <- function(...) {satisfy(function(x) {return(!!length(grep("[a-z]", x)))})}
Upper <- function(...) satisfy(function(x) {return(!!length(grep("[A-Z]", x)))})
Alpha <- function(...) satisfy(function(x) {return(!!length(grep("[A-Za-z]", x)))})
AlphaNum <- function(...) satisfy(function(x) {return(!!length(grep("[A-Za-z0-9]", x)))})
SpaceCheck <- function(...) satisfy(function(x) {return(!!length(grep("\\s", x)))})

## ---- String-------------------------------------------------------------
String <- function(string) {
  if (string=="") {
    return (succeed(NULL))
  }
  else {
    result_=substr(string, 1, 1)
    leftover_=substring(string, 2)
    return((literal(result_) %then% 
            String(leftover_)) %using% 
             function(x) {paste(unlist(c(x)), collapse="")})
  }
}
String("123")("123 abc")

## ---- ident--------------------------------------------------------------
ident <- function() {(many(AlphaNum()) %using%
          function(x) paste0(unlist(c(x)), collapse=""))}
nat <- function() {
  some(Digit()) %using%
  function(x) {paste(unlist(c(x)), collapse="")}
}
space <- function() {
  many(SpaceCheck()) %using%
  function(x) {return("")}
}
ident() ("var1 = 123")
nat() ("123456")

## ---- token--------------------------------------------------------------
token <- function(p) {
  space() %then%
    p %then%
    space() %using%
    function(x) {return(unlist(c(x))[2])}
}
token(ident()) ("   var1   ")

## ---- identifier---------------------------------------------------------
identifier <- function(...) {token(ident())}
natural <- function(...) {token(nat())}
symbol <- function(xs) {token(String(xs))}
identifier() ("   var1   ")

## ---- arith--------------------------------------------------------------
expr <- ((term %then% 
            symbol("+") %then%
            expr %using% function(x) {
              print(unlist(c(x)))
              return(sum(as.numeric(unlist(c(x))[c(1,3)])))
            }) %alt% 
          (term %then% 
            symbol("-") %then%
            expr %using% function(x) {
              print(unlist(c(x)))
              return(Reduce("-", as.numeric(unlist(c(x))[c(1,3)])))
            }) %alt% term)


term <- ((factor %then% 
            symbol("*") %then%
              term %using% function(x) {
                print(unlist(c(x)))
                return(prod(as.numeric(unlist(c(x))[c(1,3)])))
              }) %alt% 
         (factor %then% 
           symbol("/") %then%
           term %using% function(x) {
             print(unlist(c(x)))
             return(Reduce("/", as.numeric(unlist(c(x))[c(1,3)])))
          }) %alt% factor)

factor <- ((symbol("(") %then%
            expr %then%
            symbol(")") %using% function(x){
              print(unlist(c(x)))
              return(as.numeric(unlist(c(x))[2]))
            }) %alt% natural())

## ---- exp----------------------------------------------------------------
expr("2+(4-1)*3")

