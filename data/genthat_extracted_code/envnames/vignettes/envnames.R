## ----echo=FALSE----------------------------------------------------------
#library(knitr)
#opts_chunk$set(include=TRUE, warning=FALSE)

## ----echo=FALSE----------------------------------------------------------
library(envnames)

## ----Motivation----------------------------------------------------------
env1 <- new.env()
cat("The name of the environment just defined is: ", environmentName(env1), "(empty)\n")
cat("Simply referencing the environment just defined yields its memory address,
    which is not so helpful:"); print(env1)

## ----DefineEnvironments--------------------------------------------------
env1 <- new.env()
env_of_envs <- new.env()
with(env_of_envs, env21 <- new.env())

## ----GetLookupTable, warning=FALSE---------------------------------------
get_env_names()

## ----GetLookupTableRestricted, warning=FALSE-----------------------------
get_env_names(envir=env_of_envs)

## ----GetEnvironmentNames, warning=FALSE----------------------------------
environment_name(env1)
environment_name(env21)

## ----GetEnvironmentNamesSpecifyingLocation, warning=FALSE----------------
environment_name(env1, envir=globalenv())
environment_name(env21, envir=env_of_envs)

## ----DefineAnotherEnvironmentThatPointsToAnExistingEnvironment-----------
e <- env_of_envs$env21

## ----GetTheEnvironmentNameOfThisNewEnvironment---------------------------
environment_name(e)

## ----CallEnvironmentNameWithMatchNameTRUE--------------------------------
environment_name(e, matchname=TRUE)

## ----CallEnvironmentNameOnNonExistingEnvironment, warning=FALSE----------
environment_name(non_existing_env)

## ----ConvertMemoryAddressToEnvironmentName-------------------------------
env1_obj_address = get_obj_address(env1)
environment_name(env1_obj_address)

## ----EnvironmentNameOfNonEnvironmentMemoryAddressIsNULL------------------
x = 2
environment_name(get_obj_address(x))

## ----GetExecutionEnvironmentName-----------------------------------------
with(env1,
  f <- function() {
    cat("1) We are inside function", environment_name(), "\n")
  }
)
env1$f()

## ----DefineObjectsInEnvironments-----------------------------------------
x <- 5
env1$x <- 3
with(env_of_envs, env21$y <- 5)
with(env1, {
  vars_as_string <- c("x", "y", "z")
})

## ----LookForObjects1, warning=FALSE--------------------------------------
environments_where_obj_x_is_found = obj_find(x)
cat("Object 'x' found
in the following environments:"); print(environments_where_obj_x_is_found)
environments_where_obj_y_is_found = obj_find(y)
cat("Object 'y' found
in the following environments:"); print(environments_where_obj_y_is_found)

## ----LookForObjects2-----------------------------------------------------
environments_where_obj_is_found = obj_find(vars_as_string)
cat("Object 'vars_as_string' found
in the following environments:"); print(environments_where_obj_is_found)

## ----LookForObjectsWhoseNamesAreGivenInArray-----------------------------
environments_where_obj_1_is_found = obj_find(env1$vars_as_string[1])
  ## Here we are looking for the object 'x'
cat(paste("Object '", env1$vars_as_string[1], "' found
in the following environments:")); print(environments_where_obj_1_is_found)
environments_where_obj_2_is_found = obj_find(env1$vars_as_string[2])
  ## Here we are looking for the object 'y'
cat(paste("Object '", env1$vars_as_string[2], "' found
in the following environments:")); print(environments_where_obj_2_is_found)
environments_where_obj_3_is_found = obj_find(env1$vars_as_string[3])
  ## Here we are looking for the object 'z' which does not exist
cat(paste("Object '", env1$vars_as_string[3], "' found
in the following environments:")); print(environments_where_obj_3_is_found)

## ----LookForObjectsUsingSAPPLY-------------------------------------------
environments_where_objs_are_found = with(env1, sapply(vars_as_string, obj_find) )
cat("The objects defined in the 'env1$vars_as_string' array are found
    in the following environments:\n");
print(environments_where_objs_are_found)

## ----LookForObjectsUsingSAPPLYNoGlobalSearch-----------------------------
environments_where_objs_are_found = with(env1,
                      sapply(vars_as_string, obj_find, globalsearch=FALSE, envir=env1) )
cat("The objects defined in the 'env1$vars_as_string' array are found
    in the following environments (no globalsearch):\n");
print(environments_where_objs_are_found)

## ----LookForObjectAsASymbol----------------------------------------------
environments_where_obj_x_is_found = obj_find(as.name("x"))
cat("Object 'x' found
in the following environments:"); print(environments_where_obj_x_is_found)

## ----LookForObjectsDefinedInPackages-------------------------------------
environments_where_obj_is_found = obj_find(aov)
cat("Object 'aov' found
in the following environments:"); print(environments_where_obj_is_found)

## ----DefineTwoEnvironments-----------------------------------------------
env11 <- new.env()
env12 <- new.env()

## ----DefineFunctionH-----------------------------------------------------
with(globalenv(), 
h <- function(x, silent=TRUE) {
  fun_calling_chain = get_fun_calling_chain(silent=silent)

  # Do a different operation on input parameter x depending on the calling function
  fun_calling = get_fun_calling(showParameters=FALSE)
  if (fun_calling == "env11$f") { x = x + 1 }
  else if (fun_calling == "env12$f") { x = x + 2 }

  return(x)
}
)

## ----DefineTwoFunctionsFInSeparateEnvironments---------------------------
with(env11,
  f <- function(x, silent=TRUE) {
    fun_calling_chain = get_fun_calling_chain()
    return(h(x, silent=silent))
  }
)

with(env12,
  f <- function(x, silent=TRUE) {
    fun_calling_chain = get_fun_calling_chain()
    return(h(x, silent=silent))
  }
)

## ----RunFunctionF1, echo=FALSE-------------------------------------------
silent = FALSE
x = 0
cat("\nWhen h(x) is called by env11$f(x=", x, ") the output is: ", env11$f(x, silent=silent), "\n", sep="")

## ----RunFunctionF2, echo=FALSE-------------------------------------------
silent = FALSE
x = 0
cat("\nWhen h(x) is called by env12$f(x=", x, ") the output is: ", env12$f(x, silent=silent), "\n", sep="")

## ----GetObjectAddress1---------------------------------------------------
obj_address1 = get_obj_address(x)
cat("Output of 'get_obj_address(x)':\n"); print(obj_address1)
obj_address2 = with(env1, get_obj_address(x))
cat("Output of 'with(env1, get_obj_address(x))':\n"); print(obj_address2)

## ----GetObjectAddress2---------------------------------------------------
get_obj_address(env1$x)
get_obj_address(x, envir=env1)
with(env1, get_obj_address(x, envir=env1))

## ----GetNonExistentObjectAddress-----------------------------------------
vars = c("x", "y", "nonexistent")
get_obj_address(vars[1], envir=env1)
sapply(vars, get_obj_address)

## ----CheckMemoryAddressIsCorrect-----------------------------------------
address(env1$x)
address(e$y)

## ----MemoryAddressOfNULL-------------------------------------------------
address(env1$nonexistent)
address(NULL)

## ----MemoryAddressOfNonExistentIsNULL------------------------------------
get_obj_address(env1$nonexistent)

## ----SystemInfo, echo=FALSE----------------------------------------------
data.frame(SystemInfo=Sys.info()[c("sysname", "release", "version", "machine")])
version

