library(sets)


### Name: fuzzyinference
### Title: Fuzzy inference
### Aliases: fuzzy_rule fuzzy_variable fuzzy_partition fuzzy_system
###   fuzzy_inference %is%
### Keywords: math

### ** Examples

## set universe
sets_options("universe", seq(from = 0, to = 25, by = 0.1))

## set up fuzzy variables
variables <-
set(service =
    fuzzy_partition(varnames =
                    c(poor = 0, good = 5, excellent = 10),
                    sd = 1.5),
    food =
    fuzzy_variable(rancid =
                   fuzzy_trapezoid(corners = c(-2, 0, 2, 4)),
                   delicious =
                   fuzzy_trapezoid(corners = c(7, 9, 11, 13))),
    tip =
    fuzzy_partition(varnames =
                    c(cheap = 5, average = 12.5, generous = 20),
                    FUN = fuzzy_cone, radius = 5)
    )

## set up rules
rules <-
set(
    fuzzy_rule(service %is% poor || food %is% rancid,
               tip %is% cheap),
    fuzzy_rule(service %is% good,
               tip %is% average),
    fuzzy_rule(service %is% excellent || food %is% delicious,
               tip %is% generous)
    )

## combine to a system
system <- fuzzy_system(variables, rules)
print(system)
plot(system) ## plots variables

## do inference
fi <- fuzzy_inference(system, list(service = 3, food = 8))

## plot resulting fuzzy set
plot(fi)

## defuzzify
gset_defuzzify(fi, "centroid")

## reset universe
sets_options("universe", NULL)



