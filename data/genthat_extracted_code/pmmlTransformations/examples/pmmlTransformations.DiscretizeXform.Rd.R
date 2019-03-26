library(pmmlTransformations)


### Name: DiscretizeXform
### Title: Discretizes a continuous variable to a discrete one as indicated
###   by interval mappings. This is in accordance to the PMML element:
###   *Discretize*
### Aliases: DiscretizeXform
### Keywords: manip

### ** Examples

# Load the pmmlTransformations package
    library(pmmlTransformations)
    library(pmml)
# First wrap the data
    irisBox <- WrapData(iris)

## Not run: 
##D # We wish to convert the continuous variable "Sepal.Length" to a discrete
##D # variable "dsl". The intervals to be used for this transformation is 
##D # given in a file, "intervals.csv", whose content is, for example,:
##D #
##D #  5],val1
##D #  (5:6],22
##D #  (6,val2
##D #
##D # This will be used to create a discrete variable named "dsl" of dataType
##D # "string" such that:
##D #    if(Sepal.length <= 5) then dsl = "val1"  
##D #    if((Sepal.Lenght > 5) and (Sepal.Length <= 6)) then dsl = "22"
##D #    if(Sepal.Length > 6) then dsl = "val2" 
##D #
##D # Give "dsl" the value 0 if the input variable value is missing.
##D   irisBox <- DiscretizeXform(irisBox,
##D               xformInfo="[Sepal.Length -> dsl][double -> string]", 
##D               table="intervals.csv",mapMissingTo="0")
## End(Not run)

# A different transformation using a list of data frames, of size 1:
  t <- list()
  m <- data.frame(rbind(
                  c("Petal.Length","dis_pl","leftInterval","leftValue",
                  "rightInterval","rightValue"),
                  c("double","integer","string","double","string",
                  "double"),
                  c("0)",0,"open",NA,"Open",0),
                  c(NA,1,"closed",0,"Open",1),
                  c(NA,2,"closed",1,"Open",2),
                  c(NA,3,"closed",2,"Open",3), 
                  c(NA,4,"closed",3,"Open",4),
                  c("[4",5,"closed",4,"Open",NA)))

# Give column names to make it look nice; not necessary!
  colnames(m) <- c("Petal.Length","dis_pl","leftInterval","leftValue",
                  "rightInterval","rightValue")

# a textual representation of the data frame is:
#   Petal.Length  dis_pl leftInterval leftValue rightInterval rightValue
# 1 Petal.Length  dis_pl leftInterval leftValue rightInterval rightValue
# 2       double integer       string    double        string     double
# 3           0)       0         open      <NA>          Open          0
# 4         <NA>       1       closed         0          Open          1
# 5         <NA>       2       closed         1          Open          2
# 6         <NA>       3       closed         2          Open          3
# 7         <NA>       4       closed         3          Open          4
# 8           (4       5       closed         4          Open       <NA>
#
# This is a transformation that defines a derived field 'dis_pl' 
# which has the integer value '0' if the original field 
# 'Petal.Length' has a value less than 0. The derived field has a 
# value '1' if the input is greater than or equal to 0 and less 
# than 1. Note that the values of the 1st column after row 2 have 
# been deliberately given NA values in the middle. This is to 
# show that that column is meant for a textual representation of 
# the transformation as defined for the method involving external 
# files; however in this methodtheir values are not used.

# Add the data frame to a list. The default values and the missing
# values should be given as a vector, each element of the vector 
# corresponding to the element at the same index in the list. If 
# these values are not given as a vector, they will be used for the 
# first list element only.
  t[[1]] <- m
  def <- c(11)
  mis <- c(22)
  irisBox<-DiscretizeXform(irisBox,xformInfo=t,defaultValue=def,
                          mapMissingTo=mis)

# Make a simple model to see the effect.
  fit<-lm(Petal.Width~.,irisBox$data[,-5])
  pmml(fit,transforms=irisBox)



