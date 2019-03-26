library(mstrio)


### Name: get_cube
### Title: Extract a MicroStrategy cube into a R Data.Frame
### Aliases: get_cube get_cube,connection-method

### ** Examples

## No test: 
# Extract the contents of a cube into an R Data.Frame
my_cube <- get_cube(connection = conn,
                    cube_id = "5E2501A411E8756818A50080EF4524C9")

# Extract the contents in larger 'chunks' using limit.
# May require add'l server processing time.
# As a rule-of-thumb, aim for a limit setting around 10%
# to 20% of the total number of rows in the cube.
my_cube <- get_cube(connection = conn,
                    cube_id = "5E2501A411E8756818A50080EF4524C9",
                    limit = 100000)

# You can also set limit to -1. Use this only on smaller reports.
my_cube <- get_cube(connection = conn,
                    cube_id = "5E2501A411E8756818A50080EF4524C9",
                    limit = -1)
## End(No test)



