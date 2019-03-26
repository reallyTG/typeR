library(ganalytics)


### Name: comparators
### Title: Comparison operators
### Aliases: comparators %starts_with% %ends_with% %contains% %matches%
###   %between% %in% %matches%,.var,.dimOperand-method
###   %starts_with%,.var,.dimOperand-method
###   %ends_with%,.var,.dimOperand-method
###   %contains%,.var,.dimOperand-method %between%,.var,.operand-method
###   %in%,.var,.operand-method ==,.var,.operand-method
###   !=,.var,.operand-method >,.var,.metOperand-method
###   <,.var,.metOperand-method >=,.var,.metOperand-method
###   <=,.var,.metOperand-method

### ** Examples

Expr(~PagePath %starts_with% "/products")
Expr(~PagePath %ends_with% "/index.html")
Expr(~PagePath %contains% "thank-you")
Expr(~PagePath %matches% "*.thank[\\-_]?you.*")
Expr(~transactionRevenue %between% c(200, 500))
Expr(~browser %in% c("Chrome", "Firefox"))
Expr(~productName == "apple")
Expr(~bounces == 0)
Expr(~deviceCategory != "tablet")
Expr(~sessionDuration != 0)
Expr(~pageviews > 100)
Expr(~exits < 100)



