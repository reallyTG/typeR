library(operators)


### Name: pipe
### Title: Pipe an R object to a unix command
### Aliases: %|%
### Keywords: file manip

### ** Examples

  ## Not run: 
##D     rnorm(30) %|% 'head -n2'
##D     rnorm(30) %|% 'sed "s/^ *\\[[0-9]*\\]//g" '
##D     
##D     if( require(R4X ) ){
##D         x <- xml( '<root>
##D             <child id="1">
##D               <subchild id = "sub1" >foo</subchild>
##D               <subchild id = "sub2" >bar</subchild>
##D             </child>
##D             <child id="2">
##D               <subchild id="a">blah</subchild>
##D               <subchild id="b">bob</subchild>
##D               <something id="c" />
##D             </child>
##D             <fruits>
##D                <fruit>banana</fruit>
##D                <fruit>mango</fruit>
##D             </fruits>
##D           </root>' )
##D         x %|% "xml_pp | highlight -S xml -A"  
##D     }
##D   
## End(Not run)



