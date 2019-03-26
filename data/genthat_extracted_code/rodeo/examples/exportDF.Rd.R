library(rodeo)


### Name: exportDF
### Title: Export a Data Frame as HTML/TEX Code
### Aliases: exportDF

### ** Examples

# Create example table
df <- data.frame(stringsAsFactors=FALSE, name= c("growth", "dead"),
  unit= c("1/d","1/d"), expression= c("r * N * (1 - N/K)"," d * N"))

# Export as TEX: header in bold, 1st colum in italics, last column as math
tex <- exportDF(df, tex=TRUE,
  colnames=c(expression="process rate expression"),
  width=c(expression=0.5),
  align=c(expression="p"),
  funHead=setNames(replicate(ncol(df),
    function(x){paste0("\\textbf{",x,"}")}),names(df)),
  funCell=c(name=function(x){paste0("\\textit{",x,"}")},
    expression=function(x){paste0("$",x,"$")})
)
cat(tex,"\n")

# Export as HTML: non-standard colors are used for all columns
tf <- tempfile(fileext=".html")
write(x= exportDF(df, tex=FALSE,
  funHead=setNames(replicate(ncol(df),
    function(x){paste0("<font color='red'>",x,"</font>")}),names(df)),
  funCell=setNames(replicate(ncol(df),
    function(x){paste0("<font color='blue'>",x,"</font>")}),names(df))
), file=tf)
## Not run: 
##D   browseURL(tf)
##D   file.remove(tf)
## End(Not run)



