library(OpasnetUtils)


### Name: Check
### Title: Ovariable Checks
### Aliases: Check CheckCollapse CheckDecisions CheckInput CheckMarginals

### ** Examples

#library(OpasnetUtils)
#
Deca <- new(
		"odecision",
		dectable = data.frame(
				Decision = "Dec1",
				Option = c("do it", "BAU"),
				Cell = c("",""),
				Change = c("Multiply", "Identity"),
				Result = c("2", "1")
		)
)
openv.setN(10)
a <- Ovariable("a", data = data.frame(A = c("A", "B"), Result = c("1-2","2-4")))

b <- Ovariable("b", formula = function(...){2*a}, dependencies = data.frame(Name = "a"))

b <- EvalOutput(b)

b
oapply(a, a@output[c("A", "Dec1")], mean)




