library(formula.tools)


### Name: formula.parts
### Title: Manipulate the component parts of formulas, expressions, calls,
###   name/symbols and list and vectors of such objects.
### Aliases: formula.parts lhs lhs,call-method lhs,formula-method
###   lhs,<--method lhs,expression-method lhs,list-method lhs<- lhs<-
###   lhs<-,call-method lhs<- lhs<-,formula-method lhs<-,<--method
###   `lhs<-`,<--method .replace.lhs.plural lhs<- lhs<-,expression-method
###   lhs<- lhs<-,list-method op op,formula-method op,call-method
###   op,name-method op,expression-method op,list-method op,<--method op<-
###   op<- op<-,call-method op<- op<-,formula-method op<-,<--method
###   .replace.op.plural op<- op<-,expression-method op<- op<-,list-method
###   rhs .rhs.singular rhs,call-method rhs,formula-method rhs,<--method
###   rhs,expression-method rhs,list-method rhs<- .replace.rhs.singular
###   rhs<- rhs<-,call-method rhs<- rhs<-,formula-method rhs<-,<--method
###   .replace.rhs.plural .replace.ths.plural rhs<- rhs<-,expression-method
###   rhs<- rhs<-,list-method

### ** Examples


  # FORMULA
  f <- A + B ~ C + D
  lhs(f)
  lhs(f) <- quote( E / F )

  rhs(f)
  rhs(f) <- quote( G + H ) 
  op(f)
  op(rhs(f))
  op( quote(A) )  # NULL: 
  op.type(f)

  # ONE-SIDED FORMULA
  f <- ~ A   # 
  lhs(f)     # NULL
  rhs(f)     # A


  # EXPRESSION
  e <- expression( A + B == C + D )
  lhs(e)
  rhs(e)
  op(e)
  op.type(e)


  # CALL
  c <- quote( A + B > C + D )
  lhs(c)
  lhs(c) <- quote(E)
  rhs(c)

  op(c)
  op.type(c)

  # ASSIGNMENT 
  a  <- quote( A <- B ) 
  lhs(a)
  rhs(a) 
  op(a)
  op.type(a) 




