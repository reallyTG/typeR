library(dosearch)


### Name: get_derivation
### Title: Identify a causal effect from arbitrary experiments and
###   observations
### Aliases: get_derivation

### ** Examples


# Multiple input distributions (both observational and interventional)

data1 <- "
  p(z_2,x_2|do(x_1))
  p(z_1|x_2,do(x_1,y))
  p(x_1|w_1,do(x_2))
  p(y|z_1,z_2,x_1,do(x_2))
  p(w|y,x_1,do(x_2))
"

query1 <- "p(y,x_1|w,do(x_2))"

graph1 <- "
  x_1 -> z_2
  x_1 -> z_1
  x_2 -> z_1
  x_2 -> z_2
  z_1 -> y
  z_2 -> y
  x_1 -> w
  x_2 -> w
  z_1 -> w
  z_2 -> w
"

get_derivation(data1, query1, graph1)

# Selection bias

data2 <- "
  p(x,y,z_1,z_2|s)
  p(z_1,z_2)
"

query2 <- "p(y|do(x))"

graph2 <- "
  x   -> z_1
  z_1 -> z_2
  x   -> y
  y   -- z_2
  z_2 -> s
"

get_derivation(data2, query2, graph2, selection_bias = "s")

# Transportability

data3 <- "
  p(x,y,z_1,z_2)
  p(x,y,z_1|s_1,s_2,do(z_2))
  p(x,y,z_2|s_3,do(z_1))
"

query3 <- "p(y|do(x))"

graph3 <- "
  z_1 -> x
  x   -> z_2
  z_2 -> y
  z_1 -- x
  z_1 -- z_2
  z_1 -- y
  t_1 -> z_1
  t_2 -> z_2
  t_3 -> y
"

get_derivation(data3, query3, graph3, transportability = "t_1, t_2, t_3")

# Missing data

data4 <- "
  p(x*,y*,z*,m_x,m_y,m_z)
"

query4 <- "p(x,y,z)"

graph4 <- "
  z -> x
  x -> y
  x -> m_z
  y -> m_z
  y -> m_x
  z -- y
"

get_derivation(data4, query4, graph4, missing_data = "m_x : x, m_y : y, m_z : z")

# Export the DOT diagram of the derivation as an SVG file
# to the working directory via the DOT package
# PostScript format is also supported

## Not run: 
##D d <- get_derivation(data1, query1, graph1, control = list(draw_derivation = TRUE))
##D DOT::dot(d$derivation, "derivation.svg")
## End(Not run)




