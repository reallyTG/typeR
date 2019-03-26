library(R.utils)


### Name: splitByPattern
### Title: Splits a single character string by pattern
### Aliases: splitByPattern.default splitByPattern
### Keywords: programming

### ** Examples


rspCode <- "<body>Hello <%=\"world\"%></body>"
rspParts <- splitByPattern(rspCode, pattern="<%.*%>")
cat(rspCode, "\n")
print(rspParts)



