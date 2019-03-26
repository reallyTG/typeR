library(formula.tools)


### Name: split_terms
### Title: Split object into terms
### Aliases: split_terms

### ** Examples

  
  split_terms(1)                   # 1
  split_terms( quote(a) )          # a     
  split_terms( quote(-a) )         # -a   
  split_terms( quote(a+1) )        # a, 1
  split_terms( quote(1+a) )        # 1, a
  split_terms( quote(-1+a) )       # -1, a
  split_terms( quote(-1-a) )
  
  split_terms( quote(a+b+c) )      # a,b,c
  split_terms( quote((a+b)+1) )    # (a+b),1
  split_terms( quote((a+b)+1), recursive=TRUE )    # a,b,1
  split_terms( quote((a-b)+1), recursive=TRUE )    # a,-b,1
  split_terms( quote(-a) )         # -a
  
  split_terms( quote(a-1) )        # a, -1
  split_terms( quote(-a-1))        # -a, -1
  split_terms( quote( -(a+1) ) )   # -(a+1)
  split_terms( quote( -(a+1) ), recursive=TRUE )  # -a,-1
  
  split_terms( quote( ---a ))
  split_terms( quote( -(a+(b-(c+d)))), recursive=TRUE )
  



