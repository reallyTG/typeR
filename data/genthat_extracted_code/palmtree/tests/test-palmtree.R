library("palmtree")

## load data and scale points achieved to [0, 100] percent
data("MathExam14W", package = "psychotools")
MathExam14W$tests <- 100 * MathExam14W$tests/26
MathExam14W$pcorrect <- 100 * MathExam14W$nsolved/13

MathExam <- MathExam14W[,c("pcorrect", "group", "tests", "study",
                           "attempt", "semester", "gender")]


## fit PALM tree to detect potential group effects
## while globally adjusting for math ability prior to the exam
tr <- palmtree(pcorrect ~ group | tests | tests + study +
                 attempt + semester + gender, data = MathExam)

palmmod <- lm(pcorrect ~ 0 + .tree + group:.tree + tests, data = tr$data)

tr
palmmod