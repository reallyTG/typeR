library(textutils)


### Name: toHTML
### Title: Convert R Objects to HTML
### Aliases: toHTML toHTML.data.frame

### ** Examples

x <- data.frame(a = 1:3, b = rnorm(3))
cat(toHTML(x,
       col.handlers   = list(b = function(x) round(x, 1)),
       class.handlers = list(integer = function(x) 100*x)))

## [  pretty-printed...  ]
## <tr>   <th>a</th>   <th>b</th> </tr>
## <tr> <td>100</td><td>-2.3</td> </tr>
## <tr> <td>200</td><td>-0.1</td> </tr>
## <tr> <td>300</td><td>-2.8</td> </tr>




