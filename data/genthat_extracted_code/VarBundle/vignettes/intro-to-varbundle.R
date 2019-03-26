## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
## approach using lists
inventory_thresholds <- list(min = 50, max = 100)

## ... more code

adjust_inventory <- function(prod, units) {
  if (units < inventory_thresholds$min) { # low inventory
    "low inventory: order more product"
  } else {
    "inventory good"
  }
}

# ... lots more code

inventory_thresholds$min <- 90 # Oh No! team member unknowingly changes value

# ... additional code

## Runtime, logical bug
adjust_inventory("widgets", units = 60) 
## expect: "inventory good"
## received: "low inventory: order more product"


## ---- eval=F, echo=T-----------------------------------------------------
#  library("VarBundle")
#  
#  ## approach using VarBundle
#  inventory_thresholds <- varbundle(list(min = 50, max = 100))
#  
#  ## ... more code
#  
#  adjust_inventory <- function(prod, units) {
#    if (units < inventory_thresholds$min) { # low inventory
#      "low inventory: order more product"
#    } else {
#      "inventory good"
#    }
#  }
#  
#  # ... lots more code
#  
#  # Oh No! team member unknowingly changes value
#  
#  inventory_thresholds$min <- 90 ## ERROR THROWN HERE
#  
#  ## "VarBundle fields are read only."
#  
#  # ... additional code
#  
#  adjust_inventory("widgets", units = 60) ## NO LOGICAL BUG

## ------------------------------------------------------------------------
library("VarBundle")
thresholds <- varbundle(list(min = 1, max = 10))

## ------------------------------------------------------------------------
## the "list" approach
file_paths <- list(data_in = "./foo/bar/data.csv", 
                   data_out = "./foo/bar/out.csv")

# transform existing list to VarBundle
file_paths <- varbundle(file_paths)
class(file_paths)

## ------------------------------------------------------------------------
thresholds$max

## ------------------------------------------------------------------------
t1 <- "min"

thresholds[[t1]]

## ------------------------------------------------------------------------
vb <- varbundle(list(hello = 1, world = 2))
field_names(vb)

## ------------------------------------------------------------------------
is.null(vb$foobar)

## ---- eval=F, echo=T-----------------------------------------------------
#  thresholds$min <- 25

## ---- eval=F, echo=T-----------------------------------------------------
#  thresholds$new_min <- 25

## ------------------------------------------------------------------------
# integers
vb_int <- varbundle(list(a = 1L, b = 2L))
# doubles
vb_dbl <- varbundle(list(a = 1.5, b = 2.1))
#characters
vb_char <- varbundle(list(a = "foo", b = "bar"))
#logical
vb_log <- varbundle(list(a = TRUE, b = FALSE))


## ------------------------------------------------------------------------
vb_mix <- varbundle(list(a = 1L, b = 2.1, c = "foo", d = TRUE))

## ------------------------------------------------------------------------
vb_vec <- varbundle(list(nums = 1:10, colors = c("red", "green")))
vb_vec$colors

## ------------------------------------------------------------------------
vb_df <- varbundle(list(df = data.frame(a = 1:10, b = 11:20)))
vb_df$df

## ------------------------------------------------------------------------
units <- varbundle(list(min = 1, max = 100))
sales <- varbundle(list(min = 10000, max = 500000))
thresholds <- varbundle(list(units = units, sales = sales))
thresholds$sales$min

## ------------------------------------------------------------------------
simple_vb <- varbundle(list(user_id = "doe.john", 
                            role = "admin", 
                            max_resources = 25))

complex_vb <- varbundle(list(data = data.frame(a = 1:10, b = letters[1:10])))

## ------------------------------------------------------------------------
simple_vb$as.data.frame()

## ---- eval=F, echo=T-----------------------------------------------------
#  config_file <- "user_config.csv"
#  df <- simple_vb$as.data.frame()
#  readr::write_csv(df, config_file)
#  
#  new_vb <- varbundle(readr::read_csv(config_file, ))
#  new_vb

## ------------------------------------------------------------------------
df <- complex_vb$as.data.frame()
is.null(df)

## ---- eval=F, echo=T-----------------------------------------------------
#  ll <- list(a = 1, b = 2, c = 3)
#  en <- rlang::new_environment(ll)
#  vb <- VarBundle::varbundle(ll)
#  
#  ## Access elements via `$`
#  ll$a #1
#  en$a #1
#  vb$a #1
#  
#  ## Access elements via name
#  ll[["b"]] #2
#  en[["b"]] #2
#  vb[["b"]] #2
#  
#  ## Access by integer index
#  ll[[3]] #3
#  en[[3]] #NO - Throws Error
#  vb[[3]] #No - Throws Error
#  
#  ## Change Element
#  ll$a <- "foo" #foo
#  en$a <- "foo" #foo
#  vb$a <- "foo" #NO - Throws Error
#  
#  ## Add element
#  ll$bar <- "bar" #bar
#  en$bar <- "bar" #bar
#  vb$bar <- "bar" #NO - Throws Error
#  
#  ## List names
#  names(ll) #"a"   "b"   "c"   "bar"
#  names(en) #"a"   "b"   "c"   "bar"
#  field_names(vb) #"a" "b" "c"
#  names(vb) # returns attributes and methods
#  
#  ## Unique Names
#  # lists allow non-unique names
#  ll2 <- list(a = 1, a = 2)
#  ll2 # list of 2 elements
#  
#  # environments force unique names
#  en2 <- rlang::new_environment(ll2)
#  en2 # environment of 1 element (drops to force unique names)
#  
#  # varbundles require unique names
#  vb2 <- varbundle(ll2) #NO - Throws Error (VarBundle names must be unique)
#  

