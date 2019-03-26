library(ganalytics)


### Name: Segments
### Title: Segments
### Aliases: Segments Segments<- Segments,gaSegmentList-method
###   Segments,gaQuery-method Segments,ANY-method Segments<-,gaQuery-method

### ** Examples

my_segments <- Segments(list(
  bounces = PerSession(Expr(~bounces != 0)),
  conversions = PerUser(Expr(~goalCompletionsAll > 0) | Expr(~transactions > 0)),
  mobile_or_tablet = Expr(~deviceCategory %in% c("mobile", "tablet")),
  multi_session_users = Include(PerUser(Expr(~sessions > 1)), scope = "users"),
  new_desktop_users = Expr(~deviceCategory == "desktop") & Expr(~userType == "new")
))

my_query <- GaQuery(view = "987654321")
my_segments_list <- list(
  bounces = PerSession(Expr(~bounces != 0)),
  conversions = PerUser(Expr(~goalCompletionsAll > 0) | Expr(~transactions > 0)),
  mobile_or_tablet = Expr(~deviceCategory %in% c("mobile", "tablet")),
  multi_session_users = Include(PerUser(Expr(~sessions > 1)), scope = "users"),
  new_desktop_users = Expr(~deviceCategory == "desktop") & Expr(~userType == "new")
)
Segments(my_query) <- my_segments_list




