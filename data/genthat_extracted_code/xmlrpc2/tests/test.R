if (FALSE) {

    q("no")
    Rdevel

}

library(xmlrpc2)


params <- list(1L, 1:3, rnorm(3), LETTERS[1:3], charToRaw("A"))
xml <- to_xmlrpc("some_method", params)
from_xmlrpc(xml)

## md <- as.Date(c("2007-06-22", "2004-02-13"))
## rpc_serialize(md)
## cat(as.character(rpc_serialize(md)))
## 
## li <- list(1L, pi, "A")
## rpc_serialize(li)
## traceback()
## 
## li <- list(1L, 2L, 3L)
## rpc_serialize(li)
## 
## li <- list(1L, 2L, 3L)
## rpc_serialize(li)
## 