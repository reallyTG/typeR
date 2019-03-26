library(Ryacas)


### Name: Sym
### Title: Sym
### Aliases: Sym Expr Exprq Ops.Expr Math.Expr deriv.Expr print.Expr
###   as.character.Expr as.Sym as.Sym.Expr as.Sym.yacas as.character.Sym
###   as.expression.Sym deriv.Sym Integrate OpenMath2R Ops.Sym Math.Sym
###   Ops.yacas.symbol print.Sym determinant.Sym print.yacas Sym SymExpr
###   trans transtab yacas.symbol.value yDeriv yFactorial yIntegrate yLimit
###   yrewrite yUnlist Simplify Factorial List Ver N Pi Clear Factor Expand
###   Taylor InverseTaylor PrettyForm TeXForm Precision Conjugate
###   PrettyPrinter Solve Newton Set Infinity I Limit Inverse
###   'as.Expr.formula ' 'Clear.Expr ' Clear.default 'Conjugate.Expr '
###   Conjugate.default 'determinant.Expr ' 'Expand.Expr ' Expand.default
###   Factor.Expr Factor.default 'Factorial.Expr ' 'Factorial.default '
###   'Integrate.Expr ' Integrate.default 'Inverse.Expr ' 'Inverse.default
###   ' 'InverseTaylor.default ' 'Limit.Expr ' Limit.default 'List.Expr '
###   'List.default ' 'N.Expr ' 'N.default ' 'Newton.Expr ' 'Newton.default
###   ' Precision.Expr 'Precision.default ' 'PrettyForm.Expr '
###   'PrettyForm.default ' PrettyPrinter.Expr 'PrettyPrinter.default '
###   Simplify.Expr Simplify.default 'Solve.Expr ' 'Solve.default '
###   'Taylor.Expr ' 'Taylor.default ' 'TeXForm.Expr ' 'TeXForm.default '
###   'Ver.Expr ' Ver.default Identity.default Identity Subst Subst.default
###   %Where% %Where%.default
### Keywords: symbolmath

### ** Examples

## Not run: 
##D x <- Sym("x")
##D x*x
##D Integrate(x*x, x)
##D Sym("##D 
##D 
##D acos(Sym("1/2"))
##D 
##D y <- Exprq(x)
##D y*y
##D deriv(y*y, y)
##D Exprq(acos(1/2))
## End(Not run)



