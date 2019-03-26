# Degen's eight square identity

library("mvp")

LHS <-
    (
        as.mvp("a_1^2 + a_2^2 + a_3^2 + a_4^2 + a_5^2 + a_6^2 + a_7^2 + a_8^2") *
        as.mvp("b_1^2 + b_2^2 + b_3^2 + b_4^2 + b_5^2 + b_6^2 + b_7^2 + b_8^2")
    )

RHS <- (
    as.mvp("a_1 b_1 - a_2 b_2 - a_3 b_3 - a_4 b_4 - a_5 b_5 - a_6 b_6 - a_7 b_7 - a_8 b_8")^2+
    as.mvp("a_1 b_2 + a_2 b_1 + a_3 b_4 - a_4 b_3 + a_5 b_6 - a_6 b_5 - a_7 b_8 + a_8 b_7")^2+
    as.mvp("a_1 b_3 - a_2 b_4 + a_3 b_1 + a_4 b_2 + a_5 b_7 + a_6 b_8 - a_7 b_5 - a_8 b_6")^2+
    as.mvp("a_1 b_4 + a_2 b_3 - a_3 b_2 + a_4 b_1 + a_5 b_8 - a_6 b_7 + a_7 b_6 - a_8 b_5")^2+
    as.mvp("a_1 b_5 - a_2 b_6 - a_3 b_7 - a_4 b_8 + a_5 b_1 + a_6 b_2 + a_7 b_3 + a_8 b_4")^2+
    as.mvp("a_1 b_6 + a_2 b_5 - a_3 b_8 + a_4 b_7 - a_5 b_2 + a_6 b_1 - a_7 b_4 + a_8 b_3")^2+
    as.mvp("a_1 b_7 + a_2 b_8 + a_3 b_5 - a_4 b_6 - a_5 b_3 + a_6 b_4 + a_7 b_1 - a_8 b_2")^2+
    as.mvp("a_1 b_8 - a_2 b_7 + a_3 b_6 + a_4 b_5 - a_5 b_4 - a_6 b_3 + a_7 b_2 + a_8 b_1")^2
)


stopifnot(LHS==RHS)
