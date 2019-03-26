library(algstat)


### Name: bertini
### Title: Evaluate Bertini Code
### Aliases: bertini

### ** Examples

## Not run: 
##D 
##D # where does the circle intersect the line y = x?
##D code <- "
##D INPUT
##D 
##D variable_group x, y;
##D function f, g;
##D 
##D f = x^2 + y^2 - 1;
##D g = y - x;
##D 
##D END;
##D "
##D bertini(code)
##D 
##D c(sqrt(2)/2, sqrt(2)/2)
##D 
##D 
##D 
##D 
##D # where do the surfaces
##D #  x^2 - y^2 - z^2 - 1/2
##D #  x^2 + y^2 + z^2 - 9
##D #  x^2/4 + y^2/4 - z^2
##D # intersect?
##D #
##D code <- "
##D INPUT
##D 
##D variable_group x, y, z;
##D function f, g, h;
##D 
##D f = x^2 - y^2 - z^2 - 1/2;
##D g = x^2 + y^2 + z^2 - 9;
##D h = x^2/4 + y^2/4 - z^2;
##D 
##D END;
##D "
##D bertini(code)
##D 
##D # algebraic solution :
##D c(sqrt(19)/2, 7/(2*sqrt(5)), 3/sqrt(5)) # +/- each ordinate
##D 
##D 
##D 
##D 
##D # example from bertini manual
##D code <- "
##D INPUT
##D 
##D variable_group x, y;
##D function f, g;
##D 
##D f = x^2 - 1;
##D g = x + y - 1;
##D 
##D END;
##D "
##D out <- bertini(code)
##D summary(out)
##D 
##D 
##D 
##D 
##D 
##D # non zero-dimensional example
##D code <- "
##D CONFIG
##D   TRACKTYPE: 1;
##D END;
##D 
##D INPUT
##D   variable_group x, y, z;
##D   function f1, f2;
##D   f1 = x^2-y;
##D   f2 = x^3-z;
##D END;
##D "
##D out <- bertini(code)
##D # bertini(code, quiet = FALSE) # print broken here
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)



