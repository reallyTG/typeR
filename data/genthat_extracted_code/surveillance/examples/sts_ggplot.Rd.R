library(surveillance)


### Name: sts_ggplot
### Title: Time-Series Plots for '"sts"' Objects Using 'ggplot2'
### Aliases: autoplot.sts
### Keywords: hplot ts

### ** Examples

## compare traditional plot() with ggplot2-based autoplot.sts()
if (requireNamespace("ggplot2")) {
    data("measlesDE")
    plot(measlesDE)
    autoplot.sts(measlesDE)
}

## weekly incidence: population(measlesDE) gives population fractions,
## which we need to multiply by the total population
if (surveillance.options("allExamples") && requireNamespace("ggplot2")) {
    autoplot.sts(measlesDE, population = 1000000/82314906) +
        ylab("Weekly incidence [per 1 000 000 inhabitants]")
}



