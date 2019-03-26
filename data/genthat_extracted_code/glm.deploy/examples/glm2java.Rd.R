library(glm.deploy)


### Name: glm2java
### Title: Java source code generator for rapid deployment of glm
###   predictive models
### Aliases: glm2java

### ** Examples

 # Example with the iris dataset with a Logical target and numeric
 # variables, using the binomial family and the logit link function
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
 # Call the glm2java() function with default filename
 glm2java(m,, tempdir())
 # Call the glm2java() function with custom filename
 glm2java(m,'my_glm_virginica', tempdir())

 # The glm2java() function generates the file "glm_virginica_class.java".

## Not run: 
##D ----------Contents of the "glm_virgninica_class.java" file-------
##D   package test;
##D   public class glm_virginica_class{
##D 
##D   public static double glm_virginica_link(double sepal_length,
##D                                           double sepal_width,
##D                                           double petal_length,
##D                                           double petal_width){
##D       double new_sepal_length = -2.46522019518341 * sepal_length;
##D       double new_sepal_width = -6.68088701405762 * sepal_width;
##D       double new_petal_length = 9.4293851538836 * petal_length;
##D       double new_petal_width = 18.2861368877881 * petal_width;
##D 
##D       return -42.6378038127854+new_sepal_length+
##D                                new_sepal_width+
##D                                new_petal_length+
##D                                new_petal_width;
##D     }
##D     public static double glm_virginica_response(double sepal_length,
##D                                                 double sepal_width,
##D                                                 double petal_length,
##D                                                 double petal_width){
##D       return 1/(1+Math.exp(-glm_virginica_link(sepal_length,
##D                                                sepal_width,
##D                                                petal_length,
##D                                                petal_width)));
##D     }
##D 
##D   }
##D ---------------End of "glm_virgninica_class.java"---------------
##D ----------------------------------------------------------------
##D To use these methods in another class just add
##D the "import glm_virginica_class.*;"
## End(Not run)



