library("veccompare")
context("Using the compare.vectors() function")

example <- compare.vectors(veccompare::example.vectors.list)

test_that("Vector comparison using the basic input is as expected", {
	expect_equal(
		example,
		list(structure(list(elements_involved = "vector_a", union_of_elements = c("a",
"b", "c", "d", "z", "q", "x"), overlap_of_elements = c("a", "b",
"c", "d", "z", "q", "x"), elements_unique_to_first_element = structure(list(
    vector_a = c("a", "b", "c", "d", "z", "q", "x")), .Names = "vector_a")), .Names = c("elements_involved",
"union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
)), structure(list(elements_involved = c("vector_a", "vector_b"
), union_of_elements = c("a", "b", "c", "d", "z", "q", "x", "e",
"f"), overlap_of_elements = c("a", "b", "z"), elements_unique_to_first_element = structure(list(
    vector_a = c("c", "d", "q", "x"), vector_b = c("e", "f")), .Names = c("vector_a",
"vector_b"))), .Names = c("elements_involved", "union_of_elements",
"overlap_of_elements", "elements_unique_to_first_element")),
    structure(list(elements_involved = c("vector_a", "vector_c"
    ), union_of_elements = c("a", "b", "c", "d", "z", "q", "x",
    "f", "g", "h", "i"), overlap_of_elements = "b", elements_unique_to_first_element = structure(list(
        vector_a = c("a", "c", "d", "z", "q", "x"), vector_c = c("f",
        "g", "h", "i")), .Names = c("vector_a", "vector_c"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_d"
    ), union_of_elements = c("a", "b", "c", "d", "z", "q", "x",
    "i", "k", "l"), overlap_of_elements = c("b", "c"), elements_unique_to_first_element = structure(list(
        vector_a = c("a", "d", "z", "q", "x"), vector_d = c("i",
        "k", "l")), .Names = c("vector_a", "vector_d"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_e"
    ), union_of_elements = c("a", "b", "c", "d", "z", "q", "x",
    "g", "h", "k", "i"), overlap_of_elements = "a", elements_unique_to_first_element = structure(list(
        vector_a = c("b", "c", "d", "z", "q", "x"), vector_e = c("g",
        "h", "k", "i")), .Names = c("vector_a", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_f"
    ), union_of_elements = c("a", "b", "c", "d", "z", "q", "x",
    "f", "g", "w"), overlap_of_elements = "a", elements_unique_to_first_element = structure(list(
        vector_a = c("b", "c", "d", "z", "q", "x"), vector_f = c("f",
        "g", "w")), .Names = c("vector_a", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "e", "f", "g", "h", "i"), overlap_of_elements = "b",
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "q", "x"), vector_b = "e", vector_c = c("g", "h",
        "i")), .Names = c("vector_a", "vector_b", "vector_c"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_d"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "e", "f", "i", "k", "l"), overlap_of_elements = "b",
        elements_unique_to_first_element = structure(list(vector_a = c("d",
        "q", "x"), vector_b = c("e", "f"), vector_d = c("i",
        "k", "l")), .Names = c("vector_a", "vector_b", "vector_d"
        ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_e"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "e", "f", "g", "h", "k", "i"), overlap_of_elements = "a",
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "q", "x"), vector_b = c("e", "f"), vector_e = c("g",
        "h", "k", "i")), .Names = c("vector_a", "vector_b", "vector_e"
        ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_f"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "e", "f", "g", "w"), overlap_of_elements = "a",
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "q", "x"), vector_b = "e", vector_f = c("g", "w"
        )), .Names = c("vector_a", "vector_b", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_d"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "f", "g", "h", "i", "k", "l"), overlap_of_elements = "b",
        elements_unique_to_first_element = structure(list(vector_a = c("a",
        "d", "z", "q", "x"), vector_c = c("f", "g", "h"), vector_d = c("k",
        "l")), .Names = c("vector_a", "vector_c", "vector_d"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_e"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "f", "g", "h", "i", "k"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "z", "q", "x"), vector_c = "f", vector_e = "k"), .Names = c("vector_a",
        "vector_c", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_f"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "f", "g", "h", "i", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "z", "q", "x"), vector_c = c("h", "i"), vector_f = "w"), .Names = c("vector_a",
        "vector_c", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_d",
    "vector_e"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "i", "k", "l", "g", "h"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("d",
        "z", "q", "x"), vector_d = "l", vector_e = c("g", "h"
        )), .Names = c("vector_a", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_d",
    "vector_f"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "i", "k", "l", "f", "g", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("d",
        "z", "q", "x"), vector_d = c("i", "k", "l"), vector_f = c("f",
        "g", "w")), .Names = c("vector_a", "vector_d", "vector_f"
        ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_e",
    "vector_f"), union_of_elements = c("a", "b", "c", "d", "z",
    "q", "x", "g", "h", "k", "i", "f", "w"), overlap_of_elements = "a",
        elements_unique_to_first_element = structure(list(vector_a = c("b",
        "c", "d", "z", "q", "x"), vector_e = c("h", "k", "i"),
            vector_f = c("f", "w")), .Names = c("vector_a", "vector_e",
        "vector_f"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_d"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k", "l"
    ), overlap_of_elements = "b", elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_c = c("g",
        "h"), vector_d = c("k", "l")), .Names = c("vector_a",
    "vector_b", "vector_c", "vector_d"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_e"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "q", "x"), vector_b = "e", vector_c = character(0),
            vector_e = "k"), .Names = c("vector_a", "vector_b",
        "vector_c", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "q", "x"), vector_b = "e", vector_c = c("h", "i"
        ), vector_f = "w"), .Names = c("vector_a", "vector_b",
        "vector_c", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_d", "vector_e"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "i", "k", "l", "g", "h"
    ), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = c("e", "f"),
        vector_d = "l", vector_e = c("g", "h")), .Names = c("vector_a",
    "vector_b", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_d", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "i", "k", "l", "g", "w"
    ), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_d = c("i",
        "k", "l"), vector_f = c("g", "w")), .Names = c("vector_a",
    "vector_b", "vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_e", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "e", "f", "g", "h", "k", "i", "w"
    ), overlap_of_elements = "a", elements_unique_to_first_element = structure(list(
        vector_a = c("c", "d", "q", "x"), vector_b = "e", vector_e = c("h",
        "k", "i"), vector_f = "w"), .Names = c("vector_a", "vector_b",
    "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_d", "vector_e"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "f", "g", "h", "i", "k", "l"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("d",
        "z", "q", "x"), vector_c = "f", vector_d = "l", vector_e = character(0)), .Names = c("vector_a",
        "vector_c", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_d", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "f", "g", "h", "i", "k", "l", "w"
    ), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "z", "q", "x"), vector_c = "h", vector_d = c("k",
        "l"), vector_f = "w"), .Names = c("vector_a", "vector_c",
    "vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_e", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "f", "g", "h", "i", "k", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_a = c("c",
        "d", "z", "q", "x"), vector_c = character(0), vector_e = "k",
            vector_f = "w"), .Names = c("vector_a", "vector_c",
        "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_d",
    "vector_e", "vector_f"), union_of_elements = c("a", "b",
    "c", "d", "z", "q", "x", "i", "k", "l", "g", "h", "f", "w"
    ), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "z", "q", "x"), vector_d = "l", vector_e = "h",
        vector_f = c("f", "w")), .Names = c("vector_a", "vector_d",
    "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_d", "vector_e"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k",
    "l"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_c = character(0),
        vector_d = "l", vector_e = character(0)), .Names = c("vector_a",
    "vector_b", "vector_c", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_d", "vector_f"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k",
    "l", "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_c = "h",
        vector_d = c("k", "l"), vector_f = "w"), .Names = c("vector_a",
    "vector_b", "vector_c", "vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_e", "vector_f"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k",
    "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("c", "d", "q", "x"), vector_b = "e", vector_c = character(0),
        vector_e = "k", vector_f = "w"), .Names = c("vector_a",
    "vector_b", "vector_c", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_d", "vector_e", "vector_f"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "e", "f", "i", "k", "l", "g",
    "h", "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_d = "l",
        vector_e = "h", vector_f = "w"), .Names = c("vector_a",
    "vector_b", "vector_d", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_c",
    "vector_d", "vector_e", "vector_f"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "f", "g", "h", "i", "k", "l",
    "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "z", "q", "x"), vector_c = character(0),
        vector_d = "l", vector_e = character(0), vector_f = "w"), .Names = c("vector_a",
    "vector_c", "vector_d", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_a", "vector_b",
    "vector_c", "vector_d", "vector_e", "vector_f"), union_of_elements = c("a",
    "b", "c", "d", "z", "q", "x", "e", "f", "g", "h", "i", "k",
    "l", "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_a = c("d", "q", "x"), vector_b = "e", vector_c = character(0),
        vector_d = "l", vector_e = character(0), vector_f = "w"), .Names = c("vector_a",
    "vector_b", "vector_c", "vector_d", "vector_e", "vector_f"
    ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = "vector_b", union_of_elements = c("a",
    "a", "b", "e", "f", "z"), overlap_of_elements = c("a", "a",
    "b", "e", "f", "z"), elements_unique_to_first_element = structure(list(
        vector_b = c("a", "a", "b", "e", "f", "z")), .Names = "vector_b")), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c"
    ), union_of_elements = c("a", "b", "e", "f", "z", "g", "h",
    "i"), overlap_of_elements = c("b", "f"), elements_unique_to_first_element = structure(list(
        vector_b = c("a", "e", "z"), vector_c = c("g", "h", "i"
        )), .Names = c("vector_b", "vector_c"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_d"
    ), union_of_elements = c("a", "b", "e", "f", "z", "c", "i",
    "k", "l"), overlap_of_elements = "b", elements_unique_to_first_element = structure(list(
        vector_b = c("a", "e", "f", "z"), vector_d = c("c", "i",
        "k", "l")), .Names = c("vector_b", "vector_d"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_e"
    ), union_of_elements = c("a", "b", "e", "f", "z", "g", "h",
    "k", "i"), overlap_of_elements = "a", elements_unique_to_first_element = structure(list(
        vector_b = c("b", "e", "f", "z"), vector_e = c("g", "h",
        "k", "i")), .Names = c("vector_b", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_f"
    ), union_of_elements = c("a", "b", "e", "f", "z", "g", "w"
    ), overlap_of_elements = c("a", "f"), elements_unique_to_first_element = structure(list(
        vector_b = c("b", "e", "z"), vector_f = c("g", "w")), .Names = c("vector_b",
    "vector_f"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_d"), union_of_elements = c("a", "b", "e", "f", "z",
    "g", "h", "i", "c", "k", "l"), overlap_of_elements = "b",
        elements_unique_to_first_element = structure(list(vector_b = c("a",
        "e", "z"), vector_c = c("g", "h"), vector_d = c("c",
        "k", "l")), .Names = c("vector_b", "vector_c", "vector_d"
        ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_e"), union_of_elements = c("a", "b", "e", "f", "z",
    "g", "h", "i", "k"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_c = character(0), vector_e = "k"), .Names = c("vector_b",
        "vector_c", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_f"), union_of_elements = c("a", "b", "e", "f", "z",
    "g", "h", "i", "w"), overlap_of_elements = "f", elements_unique_to_first_element = structure(list(
        vector_b = c("e", "z"), vector_c = c("h", "i"), vector_f = "w"), .Names = c("vector_b",
    "vector_c", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_d",
    "vector_e"), union_of_elements = c("a", "b", "e", "f", "z",
    "c", "i", "k", "l", "g", "h"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "f", "z"), vector_d = c("c", "l"), vector_e = c("g",
        "h")), .Names = c("vector_b", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_d",
    "vector_f"), union_of_elements = c("a", "b", "e", "f", "z",
    "c", "i", "k", "l", "g", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_d = c("c", "i", "k", "l"), vector_f = c("g",
        "w")), .Names = c("vector_b", "vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_e",
    "vector_f"), union_of_elements = c("a", "b", "e", "f", "z",
    "g", "h", "k", "i", "w"), overlap_of_elements = "a", elements_unique_to_first_element = structure(list(
        vector_b = c("b", "e", "z"), vector_e = c("h", "k", "i"
        ), vector_f = "w"), .Names = c("vector_b", "vector_e",
    "vector_f"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_d", "vector_e"), union_of_elements = c("a", "b",
    "e", "f", "z", "g", "h", "i", "c", "k", "l"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_c = character(0), vector_d = c("c", "l"),
            vector_e = character(0)), .Names = c("vector_b",
        "vector_c", "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_d", "vector_f"), union_of_elements = c("a", "b",
    "e", "f", "z", "g", "h", "i", "c", "k", "l", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_c = "h", vector_d = c("c", "k", "l"), vector_f = "w"), .Names = c("vector_b",
        "vector_c", "vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_e", "vector_f"), union_of_elements = c("a", "b",
    "e", "f", "z", "g", "h", "i", "k", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_c = character(0), vector_e = "k", vector_f = "w"), .Names = c("vector_b",
        "vector_c", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_d",
    "vector_e", "vector_f"), union_of_elements = c("a", "b",
    "e", "f", "z", "c", "i", "k", "l", "g", "h", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_d = c("c", "l"), vector_e = "h", vector_f = "w"), .Names = c("vector_b",
        "vector_d", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_b", "vector_c",
    "vector_d", "vector_e", "vector_f"), union_of_elements = c("a",
    "b", "e", "f", "z", "g", "h", "i", "c", "k", "l", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_b = c("e",
        "z"), vector_c = character(0), vector_d = c("c", "l"),
            vector_e = character(0), vector_f = "w"), .Names = c("vector_b",
        "vector_c", "vector_d", "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = "vector_c", union_of_elements = c("b",
    "f", "g", "h", "i"), overlap_of_elements = c("b", "f", "g",
    "h", "i"), elements_unique_to_first_element = structure(list(
        vector_c = c("b", "f", "g", "h", "i")), .Names = "vector_c")), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_d"
    ), union_of_elements = c("b", "f", "g", "h", "i", "c", "k",
    "l"), overlap_of_elements = c("b", "i"), elements_unique_to_first_element = structure(list(
        vector_c = c("f", "g", "h"), vector_d = c("c", "k", "l"
        )), .Names = c("vector_c", "vector_d"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_e"
    ), union_of_elements = c("b", "f", "g", "h", "i", "a", "k"
    ), overlap_of_elements = c("g", "h", "i"), elements_unique_to_first_element = structure(list(
        vector_c = c("b", "f"), vector_e = c("a", "k")), .Names = c("vector_c",
    "vector_e"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_f"
    ), union_of_elements = c("b", "f", "g", "h", "i", "a", "w"
    ), overlap_of_elements = c("f", "g"), elements_unique_to_first_element = structure(list(
        vector_c = c("b", "h", "i"), vector_f = c("a", "w")), .Names = c("vector_c",
    "vector_f"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_d",
    "vector_e"), union_of_elements = c("b", "f", "g", "h", "i",
    "c", "k", "l", "a"), overlap_of_elements = "i", elements_unique_to_first_element = structure(list(
        vector_c = "f", vector_d = c("c", "l"), vector_e = "a"), .Names = c("vector_c",
    "vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_d",
    "vector_f"), union_of_elements = c("b", "f", "g", "h", "i",
    "c", "k", "l", "a", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_c = "h",
            vector_d = c("c", "k", "l"), vector_f = c("a", "w"
            )), .Names = c("vector_c", "vector_d", "vector_f"
        ))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_e",
    "vector_f"), union_of_elements = c("b", "f", "g", "h", "i",
    "a", "k", "w"), overlap_of_elements = "g", elements_unique_to_first_element = structure(list(
        vector_c = "b", vector_e = "k", vector_f = "w"), .Names = c("vector_c",
    "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_c", "vector_d",
    "vector_e", "vector_f"), union_of_elements = c("b", "f",
    "g", "h", "i", "c", "k", "l", "a", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_c = character(0),
            vector_d = c("c", "l"), vector_e = character(0),
            vector_f = "w"), .Names = c("vector_c", "vector_d",
        "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = "vector_d", union_of_elements = c("c",
    "i", "b", "k", "l"), overlap_of_elements = c("c", "i", "b",
    "k", "l"), elements_unique_to_first_element = structure(list(
        vector_d = c("c", "i", "b", "k", "l")), .Names = "vector_d")), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_d", "vector_e"
    ), union_of_elements = c("c", "i", "b", "k", "l", "a", "g",
    "h"), overlap_of_elements = c("i", "k"), elements_unique_to_first_element = structure(list(
        vector_d = c("c", "b", "l"), vector_e = c("a", "g", "h"
        )), .Names = c("vector_d", "vector_e"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_d", "vector_f"
    ), union_of_elements = c("c", "i", "b", "k", "l", "f", "g",
    "a", "w"), overlap_of_elements = character(0), elements_unique_to_first_element = structure(list(
        vector_d = c("c", "i", "b", "k", "l"), vector_f = c("f",
        "g", "a", "w")), .Names = c("vector_d", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_d", "vector_e",
    "vector_f"), union_of_elements = c("c", "i", "b", "k", "l",
    "a", "g", "h", "f", "w"), overlap_of_elements = character(0),
        elements_unique_to_first_element = structure(list(vector_d = c("c",
        "b", "l"), vector_e = "h", vector_f = c("f", "w")), .Names = c("vector_d",
        "vector_e", "vector_f"))), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = "vector_e", union_of_elements = c("a",
    "g", "h", "k", "i"), overlap_of_elements = c("a", "g", "h",
    "k", "i"), elements_unique_to_first_element = structure(list(
        vector_e = c("a", "g", "h", "k", "i")), .Names = "vector_e")), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = c("vector_e", "vector_f"
    ), union_of_elements = c("a", "g", "h", "k", "i", "f", "w"
    ), overlap_of_elements = c("a", "g"), elements_unique_to_first_element = structure(list(
        vector_e = c("h", "k", "i"), vector_f = c("f", "w")), .Names = c("vector_e",
    "vector_f"))), .Names = c("elements_involved", "union_of_elements",
    "overlap_of_elements", "elements_unique_to_first_element"
    )), structure(list(elements_involved = "vector_f", union_of_elements = c("f",
    "g", "a", "w"), overlap_of_elements = c("f", "g", "a", "w"
    ), elements_unique_to_first_element = structure(list(vector_f = c("f",
    "g", "a", "w")), .Names = "vector_f")), .Names = c("elements_involved",
    "union_of_elements", "overlap_of_elements", "elements_unique_to_first_element"
    ))) # This is from running dput() on the command when I knew it was working as expected.
	)

	expect_equal(
		length(
			purrr::map(
				example,
				"elements_involved"
			)
		),
		63
	)

	expect_equal(
		length(
			example[
				sapply(
					purrr::map(example, "elements_involved"),
					function(x){"vector_a" %in% x}
				)
			]
		),
		32
	)

	expect_equal(
		length(
			example[
				sapply(
					purrr::map(example, "elements_involved"),
					function(x){setequal(x, c("vector_a", "vector_c"))}
	  	 	)
			]
		),
		1
	)
})
