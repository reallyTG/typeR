library(tm1r)


### Name: tm1_get_mdx_view
### Title: TM1 Get Data from an MDX View
### Aliases: tm1_get_mdx_view

### ** Examples

## Not run: 
##D mdx <- "SELECT
##D   NON EMPTY
##D    {[month].[Jan],[month].[Feb],[month].[Mar]}
##D   ON COLUMNS,
##D   NON EMPTY
##D      {[account1].[Price],[account1].[Units]}
##D   ON ROWS
##D  FROM [SalesCube]
##D  WHERE
##D   (
##D    [actvsbud].[actvsbud].[Actual],
##D    [region].[region].[Argentina],
##D    [model].[model].[S Series 1.8 L Sedan]
##D   )"
##D tm1_get_mdx_view(
##D   tm1_connection("localhost", "8881", "admin", "apple"),
##D   mdx, RowElementAsColumn=FALSE)
##D 
##D con_obj <- tm1_connection("localhost", "8881", "admin", "apple")
##D tm1_get_mdx_view(con_obj,mdx)
## End(Not run)



