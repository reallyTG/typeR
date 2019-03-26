library(glm.deploy)


### Name: glm2c
### Title: C source code generator for rapid deployment of glm predictive
###   models
### Aliases: glm2c

### ** Examples


 # Example with the iris dataset with a Logical target and numeric variables,
 # using the binomial family and the logit link function
 data(iris)
 iristest = iris
 iristest$Virginica = ifelse(iristest$Species == 'virginica', TRUE,FALSE)
 iristest$Species = NULL

 # Load Package
 library(glm.deploy)
 # For repeatable results
 set.seed(123)
 # Generate the fitted glm object
 m = glm(Virginica ~ ., family = binomial(logit), data=iristest)
 # Call the glm2c() function with default filename
 glm2c(m,,tempdir())

 # Call the glm2c() function with custom filename
 glm2c(m,'my_glm_virginica', tempdir())

 # The glm2c() function generates the files: "glm_virginica.c" and
 # "glm_virginica.h"

## Not run: 
##D ---------------Contents of the "glm_virgninica.c" file---------------
##D 
##D #include <stdlib.h>
##D #include <stdio.h>
##D #include <string.h>
##D #include <math.h>
##D 
##D double glm_virginica_link(double sepal_length,
##D                           double sepal_width,
##D                           double petal_length,
##D                           double petal_width){
##D   double new_sepal_length = -2.46522019518341 * sepal_length;
##D   double new_sepal_width = -6.68088701405762 * sepal_width;
##D   double new_petal_length = 9.4293851538836 * petal_length;
##D   double new_petal_width = 18.2861368877881 * petal_width;
##D 
##D   return -42.6378038127854+new_sepal_length+
##D                            new_sepal_width+
##D                            new_petal_length+
##D                            new_petal_width;
##D }
##D double glm_virginica_response(double sepal_length,
##D                               double sepal_width,
##D                               double petal_length,
##D                               double petal_width){
##D   return 1/(1+exp(-glm_virginica_link(sepal_length,
##D                                       sepal_width,
##D                                       petal_length,
##D                                       petal_width)));
##D }
##D ----End of Contents of the "glm_virgninica.c" file------------------
##D --------------------------------------------------------------------
##D 
##D -----Contents of the "glm_virgninica.h" file------------------------
##D double glm_virginica_link(double sepal_length,
##D                           double sepal_width,
##D                           double petal_length,
##D                           double petal_width);
##D double glm_virginica_response(double sepal_length,
##D                               double sepal_width,
##D                               double petal_length,
##D                               double petal_width);
##D -----End of Contents of the "glm_virgninica.h" file-----------------
##D --------------------------------------------------------------------
##D 
##D Usage of the functions in another programs;
##D 1) We need to add an include line #include "virginica_glm.h" to all
##D source files that use library definitions.
##D 2) Link the .c file with the library object file.
##D     gcc -c glm_virginica.c
##D 3) The following is an example file "test.c" to call the functions
##D and print the result:
##D 
##D -------------------"test.c"---------------
##D #include <stdio.h>
##D #include "glm_virgnica.h" //Added to call the scoring functions.
##D 
##D int main(int argc, char *argv[]){
##D   printf("%f\n",glm_virginica_link(5.7,2.5,5.0,2.0));
##D   printf("%f\n",glm_virginica_response(5.7,2.5,5.0,2.0));
##D   return 0;
##D }
##D ---------------End of "test.c"---------------
##D ---------------------------------------------
##D 
##D 4) Compile the "test.c" file and link it to the glm_virginica shared
##D library, we also need to add the "-lm" option to link it to the
##D math.h library:
##D gcc test.c -o test glm_virginica.o -lm
##D 
##D 5) Finally Run the test.o program in linux:
##D ./test
## End(Not run)



